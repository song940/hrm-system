json.array!(@dictionaries) do |dictionary|
  json.extract! dictionary, :name, :key, :value
  json.url dictionary_url(dictionary, format: :json)
end
