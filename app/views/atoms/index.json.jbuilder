json.array!(@atoms) do |atom|
  json.extract! atom, :id, :content, :body
  json.url atom_url(atom, format: :json)
end
