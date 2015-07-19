class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :county_id
      t.integer :district_id
      t.string :address
      t.string :logitude
      t.string :latitude

      t.timestamps null: false
    end
  end
end
