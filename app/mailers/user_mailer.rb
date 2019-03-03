class UserMailer < ApplicationMailer
    default from: 'guy@h21.uk'
 
    def welcome_email
      @user = params[:user]
      @url  = 'http://example.com/login'
      mail(to: @user.email, subject: 'Welcome to My Artventory!')
    end

    def portfolio_email
      @user = params[:user]
      attachments[params[:filename]] = File.read(params[:filepath])
      mail(to: @user.email, subject: 'Your Portfolio Awaits!🤩')
    end
end
