class ItemLibrary < ApplicationRecord
  belongs_to :user
  has_many :shared_items
  has_many :comments, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :views, dependent: :destroy
  has_many :item_categories, dependent: :destroy

  validates_presence_of :name
  validates_presence_of :body

  before_create :gen_unique_token

  mount_uploader :image, ImageUploader

  def category_options
    options = [["Category (domain)", nil]]
    for category in item_categories
      options << [category.name.capitalize, category.id]
    end
    return options
  end

  def self.arrangement_options
    options = [["Arrangement", nil],
      ["Borrow", "borrow"],
      ["Peer to peer", "peer_to_peer"],
      ["On site", "on_site"]]
    return options
  end

  def self.in_stock_options
    options = [["In stock", nil],
      ["Yes", "yes"],
      ["No", "no"],
      ["Wish list", "wish_list"]]
    return options
  end

  private

  def gen_unique_token
    begin
      self.unique_token = $name_generator.next_name[0..5].downcase
      self.unique_token << "_" + SecureRandom.urlsafe_base64
    end while Survey.exists? unique_token: self.unique_token
  end
end
