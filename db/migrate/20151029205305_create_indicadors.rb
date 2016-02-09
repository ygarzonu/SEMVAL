class CreateIndicadors < ActiveRecord::Migration
  def change
    create_table :indicadors do |t|
      t.string :variableM
      t.string :nombre
      t.string :tipo
      t.string :unidad
      t.string :sentido
      t.integer :importancia
      t.integer :meta
      t.integer :meses
      t.integer :estadoA
      t.integer :peorE
      t.string :formula
      t.text :fuente
      t.date :fechaI
      t.date :fechaC
      t.references :objetivo, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
