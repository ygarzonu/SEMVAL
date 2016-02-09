class CreateLogpros < ActiveRecord::Migration
  def change
    create_table :logpros do |t|
      t.integer :meta
      t.integer :estado
      t.integer :peorE
      t.date :fechaM
      t.date :fechaC
      t.integer :valor
      t.integer :valorP
      t.references :proceso, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
