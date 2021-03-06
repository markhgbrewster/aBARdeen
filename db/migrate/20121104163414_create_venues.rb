class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :postcode
      t.text :review
      t.float :avg_star_rating
      t.string :health_rating
      t.string :health_rating_date
      t.float :longitude
      t.float :latitude

      t.timestamps
    end
  end
end
