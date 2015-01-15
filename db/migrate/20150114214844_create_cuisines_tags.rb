class CreateCuisinesTags < ActiveRecord::Migration
  def change
    create_table :cuisines_tags do |t|
      t.references :cuisine, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
