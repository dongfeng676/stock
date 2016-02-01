if @cart_items.blank?
  json.result 1
else
  json.result 0
  json.cart_items(@cart_items) do |cart_item|
    json.unique_id cart_item.unique_id.to_s
    json.user_unique_id cart_item.user.present? ? cart_item.user.unique_id.to_s : ""
    json.product_unique_id cart_item.product.present? ? cart_item.product.unique_id.to_s : ""
    if cart_item.product.present?
      json.product do
        json.unique_id cart_item.product.unique_id_to_s
        json.name cart_item.product.name.to_s
        json.images Image.get_images(cart_item.product).to_s
        json.unit if cart_item.product.unit.present?? cart_item.product.unit.name : ""
        json.stock_num cart_item.product.stock_num.to_s
        json.price cart_item.product.price.to_s
        json.old_price cart_item.product.old_price.to_s
        json.detail_category_id cart_item.product.detail_category_id.to_s
        json.hot_category_id cart_item.product.hot_category_id.to_s
        json.sale_count cart_item.product.sale_count.to_s
        json.spec cart_item.product.spec.to_s
        json.unit_price cart_item.product.unit_price.to_s
        json.origin cart_item.product.origin
        json.remark cart_item.product.remark
      end
    end
  end
end
