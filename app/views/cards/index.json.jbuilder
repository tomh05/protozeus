json.array!(@cards) do |card|
  json.extract! card, :id, :name
  json.url card_url(card, format: :json)
end
