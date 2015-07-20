class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.string :fb_uid
    	t.string :category
    	t.string :range_time
    	t.date	:start_date
    	t.date  :end_date
    	t.string :url
    	t.string :fb_post_id
    	t.string :status
    	


      t.timestamps null: false
    end
  end
end
