class Objetivo < ActiveRecord::Base
	belongs_to :proceso
	validates :objetivoV, presence: true
 
	  def to_s
	    objetivoV
	  end


	has_one :indicador

	accepts_nested_attributes_for :indicador, allow_destroy: true

	validates :objetivoV, presence: true


  	#values = Objetivo.group(:proceso).count(:objetivoV) # Objetivo belongs_to :proceso; contar el numero de objetivos(indicadores) que tiene un proceso
  	#importancia = 100/values

	
end