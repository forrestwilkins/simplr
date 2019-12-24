module SharedItemsHelper
  def shared_item_filter_options
    options = [["Choose a field to filter by", nil]]
    for field in shared_item_fields
      _field = case field
      when :body
        :description
      when :item_category_id
        'category (domain)'
      when :holder_id
        :holder
      else
        field
      end
      options << [_field.to_s.gsub("_", " ").capitalize, field]
    end
    return options
  end

  def shared_item_fields
    [:name, :body, :item_category_id, :arrangement, :item_type, :size, :aka, :originator, :contact, :address, :in_stock, :holder_id]
  end
end
