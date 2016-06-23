class Logpro < ActiveRecord::Base
  belongs_to :proceso

  validates :estado, presence: true
 
	  def to_s
	    estado
	  end


	  def logsVerdes
	  	Logpro.select("date(created_at) as ordered_date, sum(price) as total_price").
  		group("date(created_at)").having("sum(price) > ?", 100)

	  end

end
