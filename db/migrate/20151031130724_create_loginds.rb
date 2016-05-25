class CreateLoginds < ActiveRecord::Migration
  def change
    create_table :loginds do |t|
      t.integer :meta
      t.integer :estado
      t.integer :mes
      t.integer :peorE
      t.date :fechaM
      t.date :fechaC
      t.integer :valor
      t.integer :valorP
      t.references :indicador, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
