json.array!(@atom_types) do |atom_type|
  json.extract! atom_type, :id, :name
  json.url atom_type_url(atom_type, format: :json)
end
