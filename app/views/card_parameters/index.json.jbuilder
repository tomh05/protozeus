json.array!(@card_parameters) do |card_parameter|
  json.extract! card_parameter, :id, :name, :value
  json.url card_parameter_url(card_parameter, format: :json)
end
