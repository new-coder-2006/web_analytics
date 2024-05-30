class AddDurationToVisits < ActiveRecord::Migration[7.1]
  def change
    add_column :visits, :duration, :integer
  end
end
