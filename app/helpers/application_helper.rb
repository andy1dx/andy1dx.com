module ApplicationHelper
  def sort_order_collection(obj)
    return [1] if obj.blank?
    1..(obj.pluck(:sort_order).compact.count + 1)
  end
end
