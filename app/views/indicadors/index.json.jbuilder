json.array!(@indicadors) do |indicador|
  json.extract! indicador, :id, :variableM, :nombre, :tipo, :unidad, :sentido, :importancia, :meta, :meses, :estadoA, :peorE, :formula, :fuente, :fechaI, :fechaC
  json.url indicador_url(indicador, format: :json)
end
