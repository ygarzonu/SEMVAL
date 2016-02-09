class Logvar < ActiveRecord::Base
  belongs_to :variable
  validates :valor, presence: true
 
	  def to_i
	    valor
	  end



  def self.sum(variable)
  	variable.to_i + variable.to_i
  end

  def self.subst(variable)
  	variable.to_i - variable.to_i
  end


end
