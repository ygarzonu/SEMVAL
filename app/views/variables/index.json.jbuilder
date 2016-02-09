json.array!(@variables) do |variable|
  json.extract! variable, :id, :nombre, :valorPerAnt
  json.url variable_url(variable, format: :json)
end
