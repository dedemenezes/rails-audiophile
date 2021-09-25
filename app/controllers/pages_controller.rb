class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home    
    # unless user_signed_in?
    #   cookies[:user] = 'temporary cart'
    # end
    # @cookies - cookies

  end
end
