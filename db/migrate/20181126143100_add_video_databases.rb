class AddVideoDatabases < ActiveRecord::Migration[5.2]
    def change
      create_table :videos do |t|
        t.string :video_result
        t.references :user, foreign_key: true
        t.timestamps
      end
    end
  end
  