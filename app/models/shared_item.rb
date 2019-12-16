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

  validates_presence_of :name

  mount_uploader :video, VideoUploader

  def current_holder
    holder = User.find_by_id holder_id
    if holder and request_by(holder).accepted
      return holder
    end
    nil # returns nil otherwise
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

  def gen_unique_token
    begin
      self.unique_token = $name_generator.next_name[0..5].downcase
      self.unique_token << "_" + SecureRandom.urlsafe_base64
    end while Survey.exists? unique_token: self.unique_token
  end
end
