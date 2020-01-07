class SharedItem < ApplicationRecord
  belongs_to :item_library
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :pictures, dependent: :destroy
  has_many :item_requests, dependent: :destroy

  accepts_nested_attributes_for :pictures

  before_create :gen_unique_token
  before_create :max_borrow_duration_default

  validates_presence_of :name

  mount_uploader :video, VideoUploader

  def currently_in_stock
    unless current_borrower
      'yes'
    else
      'no'
    end
  end

  def current_borrow_expires_at
    if current_borrower
      request = request_by current_borrower
      return request.expires_at
    end
  end

  # check to see if anyone has borrowed item and who they are
  def current_borrower
    borrower = User.find_by_id holder_id
    if borrower and request_by(borrower).accepted
      return borrower
    end
    nil # returns nil otherwise
  end

  # primarily used for filtering
  def holder
    _holder = User.find_by_id holder_id
    if _holder and request_by(_holder).accepted
      _holder
    elsif arrangement.eql? 'borrow'
      'lending_library'
    else
      user
    end
  end

  def unaccpeted_requests?
    item_requests.where(accepted: false).present?
  end

  def request_by user
    item_requests.find_by_user_id(user.id)
  end

  def already_requested_by user
    item_requests.where(user_id: user.id).present?
  end

  def category
    item_category = ItemCategory.find_by_id item_category_id
    if item_category
      return item_category.name
    end
    nil
  end

  def category_options
    options = [["Category (domain)", nil]]
    for category in ItemLibrary.first.item_categories
      options << [category.name.capitalize, category.id]
    end
    return options
  end

  def score user=nil, get_weights=nil
    1
  end

  def _likes
    likes
  end

  private

  def max_borrow_duration_default
    self.days_to_borrow = 7 if self.days_to_borrow.blank?
  end

  def gen_unique_token
    begin
      self.unique_token = name_generator
    end while SharedItem.exists? unique_token: self.unique_token
  end
end
