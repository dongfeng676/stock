if @cart_item.present?
  json.result 0
else
  json.result 1
end