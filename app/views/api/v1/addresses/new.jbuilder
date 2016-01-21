if @address.present?
  json.result 0
  json.address do
    json.id @address.id.to_s
    json.receive_name @address.receive_name.to_s
    json.receive_phone @address.receive_phone.to_s
    json.area @address.area.to_s
    json.detail @address.detail.to_s
  end
else
  json.result 1
end