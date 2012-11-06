class AddAddress1ToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :address1, :string
  end
end
