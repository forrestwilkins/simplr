class ItemRequest < ApplicationRecord
  belongs_to :shared_item
  belongs_to :user

  def duration
    durations = { '1': '1 day',
                '7': '1 week',
                '14': '2 weeks',
                '30': '1 month' }
    durations[chosen_days_to_borrow.to_s.to_sym]
  end
end
