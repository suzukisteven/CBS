class DropVideo < ActiveRecord::Migration[5.2]
    def change
remove_column :databases, :video_result#Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")    end
end
end