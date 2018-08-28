class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, :omniauth_providers => [:google_oauth2]

  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists?
      return_user = self.where(email: auth.info.email).first
      return_user.provider = auth.provider
      return_user.uid = auth.uid
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        # user.name = auth.info.name
        user.username = auth.info.username
        user.email = auth.info.email
        user.password = Devise.friendly_token[0, 20]
        # user.oauth_token = auth.credentials.token
        # user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      end
    end
    return_user
  end
end

# class User < ApplicationRecord
#   devise :omniauthable, :omniauth_providers => [:google_oauth2]
#   def self.from_omniauth(auth)
#     # Either create a User record or update it based on the provider (Google) and the UID   
#     where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
#       user.token = auth.credentials.token
#       user.expires = auth.credentials.expires
#       user.expires_at = auth.credentials.expires_at
#       user.refresh_token = auth.credentials.refresh_token
#     end
#   end
# end