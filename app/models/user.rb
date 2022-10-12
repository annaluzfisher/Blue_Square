# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  first_name      :string           not null
#  last_name       :string           not null
#  company_name    :string
#  mailing_list    :boolean          default(FALSE)
#
class User < ApplicationRecord
   
  before_validation :ensure_session_token

 #add validations when tables are added
    
  has_secure_password

  has_one :cart, dependent: :destroy
  has_many :cart_items, through: :cart, source: :cart_items, dependent: :destroy
  has_many :items, through: :cart_items, source: :item 
  has_many :reviews, dependent: :destroy

  validates :first_name,
  presence: true

  
  validates :last_name,
  presence: true

  validates :mailing_list,
  # presence: true,
  inclusion: { in: [true, false] }

  validates :email, 
  length: { in: 5...50 },
  format: { with: URI::MailTo::EMAIL_REGEXP , message: 'must be a valid email' },
  uniqueness: true

  validates :session_token, presence: true, uniqueness: true
  validates :password, length: { in: 6..225 , allow_nil: true }

     def self.find_by_credentials(email, password)
      # debugger
      user =  User.find_by(email: email)
      user && user.authenticate(password) ?  user : nil
     end

     def reset_session_token!
      self.session_token = generate_unique_session_token
      self.save!
      self.session_token
     end


  private

  def generate_unique_session_token
    token = SecureRandom.urlsafe_base64
    while User.exists?(session_token: token)
          token = SecureRandom.urlsafe_base64
    end
    token
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  


  
end
