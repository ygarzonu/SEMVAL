module LogindsHelper

	def latest_state(ind_id, mes)
    estado = Logind.where(indicador_id: ind_id, mes: mes).first.estado || 0
    return  estado
 	end

 	def get_meta(ind_id, mes) 
 		indicador = Indicador.find(ind_id)
 		if indicador
    	if mes == 1
      	meta = indicador.estadoA 
    	else
      	meta = latest_state(ind_id, mes) + ((indicador.meta - indicador.estadoA )/11)
    	end
    end
    return meta || 0
  end
end
