class Logind < ActiveRecord::Base
  belongs_to :indicador
  
  def mejora(mes,ind)
    get_indicador(ind)
    if mes == 1
      @indicador.estadoA
    else
      get_last_state(mes) + ((@indicador.meta - @indicador.estadoA)/11)
    end
  end

 # def get_value(ind)
  #  unless estado == nil 
  #    ((get_indicador(ind).Logind.estado / get_indicador(ind).Logind.meta)*100)
  #  else

  #  end
 # end

  def days_in_month(month, year = now.year)
    if month == 2 && ::Date.gregorian_leap?(year)
      29
    else
      COMMON_YEAR_DAYS_IN_MONTH[month]
    end
  end


  private

  def get_indicador(ind)
    @indicador = Indicador.find(ind.to_i)
  end

  def get_last_state(mes)
    Logind.find_by_mes(mes -1).estado
  end
end
