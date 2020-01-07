class ItemRequestsController < ApplicationController
  before_action :set_item_request, only: [:update, :destroy]
  before_action :set_shared_item, only: [:create, :destroy, :index]

  def index
    @item_requests = @shared_item.item_requests.reverse
  end

  def create
    @item_request = ItemRequest.new user_id: current_user.id, shared_item_id: @shared_item.id
    if @item_request.save
      Note.notify :shared_item_request, @shared_item, @shared_item.user, current_user unless @shared_item.user.eql? current_user
    end
  end

  def update
    @shared_item = @item_request.shared_item
    # accepts item request and sets expiry for item request or duration of use
    if @item_request.update accepted: true, expires_at: @shared_item.days_to_borrow.days.from_now.to_datetime
      @shared_item.update holder_id: @item_request.user.id
      # notifies user that item request was accepted
      Note.notify :shared_item_request_accepted, @shared_item, @item_request.user, current_user
      redirect_to show_shared_item_path @item_request.shared_item.unique_token
    end
  end

  def destroy
    @item_request.destroy
  end

  private

  def set_shared_item
    @shared_item = SharedItem.find params[:shared_item_id]
  end

  def set_item_request
    @item_request = ItemRequest.find params[:id]
  end

  def admin_only
    unless admin?
      redirect_to sessions_new_path
    end
  end

  def invite_only
    unless invited?
      redirect_to sessions_new_path
    end
  end
end
