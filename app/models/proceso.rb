class Proceso < ActiveRecord::Base

	belongs_to :user

	

	has_many :objetivos, dependent: :destroy

	accepts_nested_attributes_for :objetivos,
		reject_if: proc { |attr| attr['objetivoV'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
		allow_destroy: true

	validates :nombre, presence: true
	 
	def to_s
	    nombre
	  end 


	has_many :logpros, dependent: :destroy

	accepts_nested_attributes_for :logpros,
		reject_if: proc { |attr| attr['estado'].blank? }

	validates :meta, presence: true

	

end