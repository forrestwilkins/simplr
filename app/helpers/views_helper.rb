module ViewsHelper
  def percent_of_views_this_size amount_this_size
    (amount_this_size.to_f / View.all.size.to_f) * 100
  end
end
