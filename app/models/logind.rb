class Logind < ActiveRecord::Base
  belongs_to :indicador


#validación de ingreso de registros mes a mes de los indicadores
  #attr_accessible :id, :stripe_token, :expiry_date
 
  def set_expiry_date
  	Logind.expiry_date = Date.today.next_month
  	Logind.save
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
