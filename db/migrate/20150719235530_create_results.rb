class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
    	t.integer :event_id, :index=>:true
    	t.string :description

      t.timestamps null: false
    end
  end
end
