class CreateGarbages < ActiveRecord::Migration
  def change
    create_table :garbages do |t|
      t.string :name
      t.string :description
      t.integer :garbage_type_id, index:true

      t.timestamps null: false
    end
  end
end
