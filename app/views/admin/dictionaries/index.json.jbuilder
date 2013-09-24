json.array!(@admin_dictionaries) do |admin_dictionary|
  json.extract! admin_dictionary, :name, :key, :value
  json.url admin_dictionary_url(admin_dictionary, format: :json)
end
