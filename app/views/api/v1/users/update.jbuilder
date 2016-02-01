if @user.blank? && @flag != "1"
  json.result 1
else
  json.result 0
  json.unique_id @user.unique_id
  json.name @user.user_name.to_s
  json.image Image.where(target_id:@user.id,target_type:"User").first.image.url.to_s
  if @user.identification == 0
    json.identification "未认证"
  else
    json.identification "认证"
  end
  json.phone_num @user.phone_num.to_s
  json.rand @user.rand.to_s
end