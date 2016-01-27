json.array!(@pages) do |page|
  json.extract! page, :id, :name, :slug, :heading, :body
  json.url page_url(page, format: :json)
end
