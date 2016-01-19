json.result 0
json.categories(@categories) do |category|
  json.id category.id
  json.name category.name
  json.desc category.desc
  json.sub_categories(category.sub_categories) do |sub_cat|
    json.id sub_cat.id
    json.name sub_cat.name
    json.desc sub_cat.desc
    json.detail_categories(sub_cat.detail_categories) do |detail_cat|
      json.id detail_cat.id
      json.name detail_cat.name
      json.desc detail_cat.desc
    end
  end
end