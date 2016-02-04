if @order.blank?
  json.result 1
else
  json.result 0
  json.order do 
    json.unique_id @order.unique_id.to_s
    json.receive_name @order.receive_name.to_s
    json.phone_num @order.phone_num.to_s  
    json.state @order.state.to_s
    json.created_at @order.created_at.present?? @order.created_at.strftime("%Y-%m-%d %H:%M:%S").to_s　: ""
    json.delivery_time @order.delivery_time.present?? @order.delivery_time.strftime("%Y-%m-%d %H:%M:%S").to_s : ""
    json.complete_time @order.complete_time.present?? @order.complete_time.strftime("%Y-%m-%d %H:%M:%S").to_s : ""
    json.address @order.get_address.to_s
    if @order.products.present?
      json.products(JSON.parse(@order.products)) do |pro_hash|
        json.unique_id pro_hash["unique_id"].to_s
        json.number pro_hash["number"].to_s
        product = Product.find_by(unique_id:pro_hash["unique_id"])
        if product.present?
          json.name product.name.to_s
          json.image Image.get_images(product).first.to_s
          json.unit if product.unit.present?? product.unit.name.to_s : ""
          json.stock_num product.stock_num.to_s
          json.price product.price.to_s
          json.old_price product.old_price.to_s
          json.detail_category_id product.detail_category_id.to_s
          json.hot_category_id product.hot_category_id.to_s
          json.sale_count product.sale_count.to_s
          json.spec product.spec.to_s
          json.unit_price product.unit_price.to_s
          json.origin product.origin.to_s
          json.remark product.remark.to_s
        end
      end
    end
  end
end
