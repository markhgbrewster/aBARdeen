class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :name
      t.integer :rating
      t.integer :venue_id
      t.string :street

      t.timestamps
    end
  end
end
