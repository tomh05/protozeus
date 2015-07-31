json.array!(@card_instances) do |card_instance|
  json.extract! card_instance, :id, :card_id
  json.url card_instance_url(card_instance, format: :json)
end
