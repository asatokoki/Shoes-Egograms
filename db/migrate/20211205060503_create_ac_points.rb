class CreateAcPoints < ActiveRecord::Migration[5.2]
  def change
    create_table :ac_points do |t|
      t.integer :answerer_id
      t.integer :evaluated_user_id
      t.integer :point
      t.timestamps
    end
  end
end
