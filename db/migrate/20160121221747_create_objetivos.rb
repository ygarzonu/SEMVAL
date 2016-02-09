class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.text :ObjetivoV
      t.references :proceso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
