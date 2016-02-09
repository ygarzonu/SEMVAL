json.array!(@logvars) do |logvar|
  json.extract! logvar, :id, :valor, :fechaD, :variable_id
  json.url logvar_url(logvar, format: :json)
end
