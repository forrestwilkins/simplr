class ViewsController < ApplicationController
  before_action :dev_or_admin_only, only: [:user_index, :index, :show]
  before_action :new_view, only: [:record_visit, :create]

  def record_visit
    for i in [:screen_width, :screen_height, :avail_screen_width, :avail_screen_height,
      :device_pixel_ratio, :current_url, :controller_name, :action_name, :ip_address]
      @view.write_attribute(i, params[i])
    end
    @view.save
  end

  def create
    @view.click = true
    for i in [:x_pos, :y_pos, :screen_width, :screen_height, :avail_screen_width, :avail_screen_height,
      :device_pixel_ratio, :current_url, :controller_name, :action_name, :ip_address]
      @view.write_attribute(i, params[i])
    end
    @view.save
  end

  def show
    @view = View.find_by_id params[:id]
  end

  def user_index
    @user = User.find_by_unique_token params[:token]
    @unique_views = []
    for view in @user.views.reverse
      @unique_views << view unless @unique_views.any? { |v| true }
    end
    @views = @unique_views.sort_by { |v| v.created_at }.reverse
  end

  def anon_index
  end

  def click_index
    @user = User.find_by_unique_token params[:token]
    @clicks = @user.views.clicks.reverse
  end

  def index
    @views = View.all.unique_views
    @views = @views.sort_by { |v| v.created_at }.reverse
  end

  private

  def new_view
    @user_id = current_user.id if current_user
    @view = View.new user_id: @user_id
  end

  def dev_or_admin_only
    unless dev? or admin?
      redirect_to lacks_permission_path
    end
  end
end
