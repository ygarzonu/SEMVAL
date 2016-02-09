json.array!(@loginds) do |logind|
  json.extract! logind, :id, :meta, :estado, :peorE, :fechaM, :fechaC, :valor, :valorP, :proceso_id
  json.url logind_url(logind, format: :json)
end
