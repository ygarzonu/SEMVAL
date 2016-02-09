class CreateJoinTableVariablesIndicadors < ActiveRecord::Migration
  def change
    create_join_table :variables, :indicadors do |t|
      # t.index [:variable_id, :indicador_id]
      # t.index [:indicador_id, :variable_id]
    end
  end
end
