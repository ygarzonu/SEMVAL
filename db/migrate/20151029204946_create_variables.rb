class CreateVariables < ActiveRecord::Migration
  def change
    create_table :variables do |t|
      t.string :nombre
      t.string :valorPerAnt
      t.references :indicador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
