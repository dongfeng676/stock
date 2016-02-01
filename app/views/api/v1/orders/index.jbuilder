if @orders.blank?
  json.result 1
else
  json.result 0
  json.orders(@orders) do |order|
    json.unique_id order.unique.to_s
    json.receive_name order.receive_name.to_s
    json.phone_num order.phone_num.to_s
    json.created_at order.created_at.to_s
  end
end
