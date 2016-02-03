if @detail_category.present?
  json.result 0
  json.detail_category do
    json.unique_id @detail_category.unique_id
    json.name @detail_category.name
    json.desc @detail_category.desc
  end
  if @products.present?
    json.products(@products) do |product|
      json.unique_id product.unique_id.to_s
      json.name product.name.to_s
      json.desc product.desc.to_s
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
else
 json.result 1
end
