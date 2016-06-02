class Logind < ActiveRecord::Base
  belongs_to :indicador
  
  def mejora(mes,ind)
    get_indicador(ind)
    if mes == 1
      @meta = @indicador.estadoA
    else
      @meta = get_last_state(mes) + ((@indicador.meta - @indicador.estadoA)/11)
    end
    @meta
  end

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

 
end
