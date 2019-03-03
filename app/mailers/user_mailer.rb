class UserMailer < ApplicationMailer
    default from: 'guy@h21.uk'
 
    def welcome_email
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Artventory!')
    end
end
