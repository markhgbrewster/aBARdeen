class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :venue_id
      t.float :star_rating
      t.string :review_summary
      t.text :review_text

      t.timestamps
    end
  end
end
