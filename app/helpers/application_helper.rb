module ApplicationHelper
  def time_show(time)
    time.strftime("%Y-%m-%d %H:%M:%S") if time.present?
  end

  def address_info
    address_arr = []
    Address.all.each do |address|
      complete_address = address.province + " " + address.city + " " + address.region + " " + address.detail
      address_arr << [complete_address,address.id]
    end
    address_arr
  end


  def address_show(address)
    if address.present?
      complete_address = address.province + " " + address.city + " " + address.region + " " + address.detail.to_s
    else
      complete_address = "暂无"
    end
    complete_address
  end

end
