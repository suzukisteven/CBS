class Company < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :users, dependent: :destroy

    def search_employees(query)
        self.users.where("firstname ILIKE :firstname", firstname:  "%#{query}%")
        # self.where("firstname ILIKE :firstname", firstname: "%#{query}%").map do |record|
        #   record.firstname
        # end
    end
end
