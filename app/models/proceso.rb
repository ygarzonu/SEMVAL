class Proceso < ActiveRecord::Base

	belongs_to :user	


	has_many :objetivos, dependent: :destroy
	has_many :logpros, dependent: :destroy


	validates :nombre, presence: true
	validates :meta, presence: true


	accepts_nested_attributes_for :objetivos,
		reject_if: proc { |attr| attr['objetivoV'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
		allow_destroy: true

	accepts_nested_attributes_for :logpros,
		reject_if: proc { |attr| attr['estado'].blank? }

	
	def porcentaje_importancia
		get_proceso (proc)
		@importancia = @proceso.importancia
		sum(@importancia) 
	end	

	
	private

	  def get_proceso(proc)
	    @proceso = Proceso.find(proc.to_i)
	  end

end