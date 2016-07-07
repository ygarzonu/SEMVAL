class Logpro < ActiveRecord::Base
	belongs_to :proceso

	validates :estado, presence: true
 
	def mejora(mes)
	    get_proceso (proc)
	    if mes == 1
	      @meta = @proceso.estado
	    else
	      @meta = get_last_state(mes) + ((@proceso.meta - @proceso.estado)/11)
	    end
	    @meta
  	end


	def logsVerdes
	  	Logpro.select("date(created_at) as ordered_date, sum(price) as total_price").
  		group("date(created_at)").having("sum(price) > ?", 100)

	end

	private

	  def get_proceso(proc)
	    @proceso = Proceso.find(proc.to_i)
	  end

end
