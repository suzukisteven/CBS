class CreateDatabases < ActiveRecord::Migration[5.2]
    def change
      create_table :databases do |t|
        t.string :text
        t.string :text_result
        t.string :video_result
        t.references :user, foreign_key: true
        t.timestamps
      end
    end
  end
  