class Indicador < ActiveRecord::Base
#asociación entre los modelos  
  belongs_to :objetivo
  has_many :commments
  has_many :variables
  has_many :loginds, dependent: :destroy

  validates :variableM, presence: true
  validates :meta, presence: true
  validates :nombre, presence: true

  accepts_nested_attributes_for :loginds,
    reject_if: proc { |attr| attr['meta'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
    allow_destroy: true

  accepts_nested_attributes_for :variables,
    reject_if: proc { |attr| attr['nombre'].blank? }, # comprueba si el atributo anidado está en blanco y si lo está no toma en cuenta el accept_nested_attributes_for y envia el formulario sin ellos.
    allow_destroy: true

  after_create :variablePerAnt
 
  def variablePerAnt
    #if valorPerAnt != null
    #  v = variable.find(:variable_id)
    #end
  end
 
  def calculate(operator)
    # aqui se especifica operadores esperados:
    raise ArgumentError unless [:*, :+, :-, :/].include? operator.to_s
    variable.public_send(op, variables)
  end
end