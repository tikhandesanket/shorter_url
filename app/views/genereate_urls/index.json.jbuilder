json.array!(@genereate_urls) do |genereate_url|
  json.extract! genereate_url, :id, :url_name
  json.url genereate_url_url(genereate_url, format: :json)
end
