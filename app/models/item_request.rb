class ItemRequest < ApplicationRecord
  belongs_to :shared_item
  belongs_to :user
end
