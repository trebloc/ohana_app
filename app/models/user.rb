class User < ActiveRecord::Base
  has_many :events, foreign_key: 'host_id'
  has_many :reservations, dependent: :destroy
  has_secure_password

  validates :first_name,
            presence:   true,
            length:   { maximum: 255 }
  validates :last_name,
            presence:   true,
            length:   { maximum: 255 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false },
            length:     { maximum: 255 }
  VALID_PASSWORD_REGEX = /[a-zA-Z0-9]+/
  validates :password,
            presence:   true,
            length:     { minimum: 8 }  

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end    
end
