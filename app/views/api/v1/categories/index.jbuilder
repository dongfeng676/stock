json.result 0
json.categories(@categories) do |category|
  json.uid category.id
  json.name category.name
  json.desc category.desc
end