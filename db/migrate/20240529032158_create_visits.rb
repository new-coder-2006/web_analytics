class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.integer :user_id
      t.string :page_url
      t.string :ip_address
      t.string :user_agent

      t.timestamps
    end
  end
end
