class RemoveReviewFromVenues < ActiveRecord::Migration
  def up
    remove_column :venues, :review
  end

  def down
    add_column :venues, :review, :text
  end
end
