if @order.present?
  json.result 0
else
  json.result 1
end