json.array!(@template_parameters) do |template_parameter|
  json.extract! template_parameter, :id, :name, :value, :atom_id, :param_type
  json.url template_parameter_url(template_parameter, format: :json)
end
