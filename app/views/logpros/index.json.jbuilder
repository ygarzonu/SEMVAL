json.array!(@logpros) do |logpro|
  json.extract! logpro, :id, :meta, :estado, :peorE, :fechaM, :fechaC, :valor, :valorP, :proceso_id
  json.url logpro_url(logpro, format: :json)
end
