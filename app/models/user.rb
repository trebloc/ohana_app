class User < ActiveRecord::Base
  has_many :events, foreign_key: 'host_id'
  has_many :reservations
  has_secure_password

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end    
end
