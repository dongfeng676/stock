json.result 0
json.detail_category do
  json.id @detail_category.id
  json.name @detail_category.name
  json.desc @detail_category.desc
end
if @products.present?
  json.products(@products) do |product|
    json.name product.name
    json.images Image.get_images(product)
    json.unit if product.unit.present?? product.unit.name : ""
    json.stock_num product.stock_num
    json.price product.price
    json.old_price product.old_price
    json.detail_category_id product.detail_category_id
    json.hot_category_id product.hot_category_id
    json.sale_count product.sale_count
  end
end