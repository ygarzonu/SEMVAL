class CreateProcesos < ActiveRecord::Migration
  def change
    create_table :procesos do |t|
      t.string :nombre
      t.integer :importancia
      t.text :objetivo
      t.integer :meta
      t.date :fechaI
      t.date :fechaC
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
