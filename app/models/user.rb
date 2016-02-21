class User < ActiveRecord::Base
  has_many :events, dependent: :destroy   
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end    
end
