class Logind < ActiveRecord::Base
  belongs_to :indicador

  before_create :mejora
  
  
  #  def mejora(mes)
   #   if mes == 1
    #     puts self.indicador.estado
     # else
     #   @meta = self.indicador.meta
     #   puts @meta
      #  @estado = self.estado
      #  puts @estado
      #  @peorE = self.indicador.peorE
      #  puts @estado
      #  @mejora = (@estado + ((@meta - @peorE)/11))
      #  puts @mejora
      #end

    #  if mes == 1
    #  "#{estado}".parameterize
    #  else 
    #    @meta = "#{meta}".to_i          # @meta -> variable de instancia
    #    @estado = "#{estado}".to_i
    #    @peorE = "#{peorE}".to_i
    #    @mejora = (@estado + ((@meta - @peorE)/11))
    #  end
    end

  
  def set_peor_escenario
    Logind.peorE = 0
  end


def days_in_month(month, year = now.year)
  if month == 2 && ::Date.gregorian_leap?(year)
    29
  else
    COMMON_YEAR_DAYS_IN_MONTH[month]
  end
end


#validación de ingreso de registros mes a mes de los indicadores
  #attr_accessible :id, :stripe_token, :expiry_date

 
before_create :set_expiry_date
L=Logind.last

def set_expiration_date
  self.expiration =  Date.today + 30.days
end
 
  def set_expiry_date
  	Logind.expiry_date = Date.today.next_month
  end
 
  def remaining_days
  	expired? ? 0 : (Date.today - Logind.expiry_date).to_i
  end
 
  def expired?
  	(Date.today - Logind.expiry_date).to_i <= 0
  end
 
  def expired_today?
  	!expiry_date.nil? && Date.today == Logind.expiry_date
  end


end
