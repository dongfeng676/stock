if @detail_category.present?
  json.result 0
  json.detail_category do
    json.unique_id @detail_category.unique_id
    json.name @detail_category.name
    json.desc @detail_category.desc
  end
  if @products.present?
    json.products(@products) do |product|
      json.unique product.unique_id
      json.name product.name
      json.images Image.get_images(product)
      json.unit if product.unit.present?? product.unit.name : ""
      json.stock_num product.stock_num
      json.price product.price
      json.old_price product.old_price
      json.detail_category_id product.detail_category_id
      json.hot_category_id product.hot_category_id
      json.sale_count product.sale_count
      json.spec product.spec.to_s
      json.unit_price product.unit_price.to_s
      json.origin product.origin
      json.remark product.remark
    end
  end
else
 json.result 1
end
