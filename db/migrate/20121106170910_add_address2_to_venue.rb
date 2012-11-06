class AddAddress2ToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :address2, :string
  end
end
