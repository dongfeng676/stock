if @token.blank?
  json.result 1
  json.token ""
else
  json.result 0
  json.token @token.to_s
end
