class CreateLogvars < ActiveRecord::Migration
  def change
    create_table :logvars do |t|
      t.integer :valor
      t.date :fechaD
      t.references :variable, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
