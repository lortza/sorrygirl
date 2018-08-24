# frozen_string_literal: true

json.array!(@apologies) do |apology|
  json.extract! apology, :id, :body, :image
  json.url apology_url(apology, format: :json)
end
