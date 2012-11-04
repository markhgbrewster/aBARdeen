class AddReviewToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :review, :string
  end
end
