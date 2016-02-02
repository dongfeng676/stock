if @category.present?
  json.result 0
  json.unique_id @category.unique_id.to_s
  json.name @category.name.to_s
  json.desc @category.desc.to_s
  json.sub_categories(@category.sub_categories) do |sub_category|
    json.unique_id sub_category.unique_id.to_s
    json.name sub_category.name.to_s
    json.desc sub_category.desc.to_s
    if sub_category.detail_categories.present?
      json.details_categories(sub_category.detail_categories) do |det_category|
        json.unique_id det_category.unique_id.to_s
        json.name det_category.name.to_s
        json.desc det_category.desc.to_s
      end
    end
  end
else
  json.result 1
end

