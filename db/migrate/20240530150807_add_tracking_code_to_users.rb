class AddTrackingCodeToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :tracking_code, :string
  end
end
