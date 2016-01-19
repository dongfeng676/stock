json.result 0
json.adverts(@adverts) do |advert|
  json.product_id advert.product_id
  json.image_url Image.get_images(advert).first.to_s
end
json.populars(@popular_product) do |pop_product|
  json.name pop_product.name
  json.images Image.get_images(pop_product)
  json.unit pop_product.unit.name
  json.stock_num pop_product.stock_num
  json.price pop_product.price
  json.old_price pop_product.old_price
  json.detail_category_id pop_product.detail_category_id
  json.hot_category_id pop_product.hot_category_id
  json.sale_count pop_product.sale_count
end