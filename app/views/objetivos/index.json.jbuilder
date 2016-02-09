json.array!(@objetivos) do |objetivo|
  json.extract! objetivo, :id, :variableM, :nombre, :tipo, :unidad, :sentido, :importancia, :meta, :meses, :estadoA, :peorE, :formula, :fuente, :fechaI, :fechaC
  json.url objetivo_url(objetivo, format: :json)
end
