if @categories.present?
  json.result 0
  json.categories(@categories) do |category|
    json.unique_id category.unique_id.to_s
    json.name category.name.to_s
    json.desc category.desc.to_s
  end
  if @sub_categories.present?
    json.sub_categories(@sub_cateogries) do |sub_category|
      json.unique_id sub_category.unique_id.to_s
      json.name sub_category.name.to_s
      json.desc sub_category.desc.to_s
      if sub_cateogry.detail_categories.present?
        json.details_categories(sub_category.detail_categories) do |det_category|
      end
    end
    if @detail_categories.present?
      json.detail_categories(sub_cat.detail_categories) do |detail_cat|
        json.unique_id detail_cat.unique_id.to_s
        json.name detail_cat.name.to_s
        json.desc detail_cat.desc.to_s
      end
    end
  end
else
  json.result 1
end
