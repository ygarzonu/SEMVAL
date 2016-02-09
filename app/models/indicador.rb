class Indicador < ActiveRecord::Base
#asociación entre los modelos  
  belongs_to :objetivo
  validates :variableM, presence: true

   def to_s
	    variableM
	  end
  


  has_many :commments


  has_many :loginds, dependent: :destroy
  accepts_nested_attributes_for :loginds,
		reject_if: proc { |attr| attr['meta'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
		allow_destroy: true
  validates :meta, presence: true

  	def to_i
  		meta
  	end


  has_many :variables
  accepts_nested_attributes_for :variables,
    reject_if: proc { |attr| attr['nombre'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
    allow_destroy: true
  validates :nombre, presence: true

    def to_s
      nombre
    end

   def resultados    
     1 + 1 
   end


	def calculate(operator)
	  # specify accepted operators here:
	  raise ArgumentError unless [:*, :+, :-, :/].include? operator.to_sym
	  variable.public_send(op, variables)
	end

end
