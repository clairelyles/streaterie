class CreateStreaterieLocs < ActiveRecord::Migration
  def change
    create_table :streaterie_locs do |t|
      t.string :cuisine
      t.string :recipe

      t.timestamps
    end
  end
end
