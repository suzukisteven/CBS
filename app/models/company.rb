class Company < ApplicationRecord
    mount_uploader :image, ImageUploader
    has_many :users, dependent: :destroy
end
