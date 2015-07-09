class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.text  :intro
      t.date :birthday
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
