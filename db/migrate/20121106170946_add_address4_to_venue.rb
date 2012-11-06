class AddAddress4ToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :address4, :string
  end
end
