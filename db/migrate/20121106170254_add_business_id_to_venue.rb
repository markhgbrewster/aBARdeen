class AddBusinessIdToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :business_id, :string
  end
end
