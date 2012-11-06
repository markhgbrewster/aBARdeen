class AddAddress3ToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :address3, :string
  end
end
