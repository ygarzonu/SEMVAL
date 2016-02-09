class Logpro < ActiveRecord::Base
  belongs_to :proceso

  validates :estado, presence: true
 
	  def to_s
	    estado
	  end

end
