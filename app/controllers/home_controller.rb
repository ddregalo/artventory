require 'securerandom'

class HomeController < ApplicationController
  def index
    p current_user.uid
    if !current_user.uid.present?
      current_user.update(uid: SecureRandom.uuid)
      p current_user.uid
    end
  end
end
