class CreateEgograms < ActiveRecord::Migration[5.2]
  def change
    create_table :egograms do |t|

      t.string :type_name
      t.string :strong_point_title
      t.text :strong_point_body
      t.string :weak_point_title
      t.text :weak_point_body
      t.string :advice_title
      t.text :advice_body
      t.string :egogram_image_id
      t.timestamps
    end
  end
end
