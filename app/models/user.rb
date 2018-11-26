class User < ApplicationRecord
  include Clearance::User
  has_many :authentications, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy
  
  mount_uploader :image, ImageUploader
  belongs_to :company, optional: true
  has_many :databases, dependent:  :destroy
  has_many :videos, dependent:  :destroy
  enum position: { manager: 0, employee: 1}
 
  def self.create_with_auth_and_hash(authentication, auth_hash)
    user = self.create!(
      firstname: auth_hash["info"]["name"],
      email: auth_hash["info"]["email"],
      password: SecureRandom.hex(10)
    )
    user.authentications << authentication
    return user
  end
 
  # grab google to access google for user data
  def google_token
    x = self.authentications.find_by(provider: 'google_oauth2')
    return x.token unless x.nil?
  end

  def find_or_create_braintree_customer(nonce_from_the_client)
    if self.braintree_customer_id 
      Braintree::Customer.find(self.braintree_customer_id)
      # byebug
    else
      result = Braintree::Customer.create(
      first_name: self.firstname,
      last_name: self.lastname,
      payment_method_nonce: nonce_from_the_client
      )
      self.update(braintree_customer_id: result.customer.id)
      result.customer
    end
  end

  def get_existing_braintree_customer
    Braintree::Customer.find(self.braintree_customer_id)
  end
end
