require 'rails_helper'

def sign_in_with_google_oauth(service = :google_oauth2)
    visit "user/auth/#{service}"
end
