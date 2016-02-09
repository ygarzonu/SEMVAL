json.array!(@procesos) do |proceso|
  json.extract! proceso, :id, :nombre, :importancia, :objetivo, :meta, :fechaI, :fechaC
  json.url proceso_url(proceso, format: :json)
end
