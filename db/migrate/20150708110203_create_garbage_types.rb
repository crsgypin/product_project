class CreateGarbageTypes < ActiveRecord::Migration
  def change
    create_table :garbage_types do |t|
      t.string :name
      t.integer :price

      t.timestamps null: false
    end
  end
end
