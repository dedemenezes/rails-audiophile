class ApplicationController < ActionController::Base
  include CurrentCart
  include Pundit

  before_action :authenticate_user!, :nav_categories, :set_cart

  # Pundit: allowlist approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end

  private

  def banner_image
    if request.user_agent.match? /\b(Android|iPhone|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
      session[:device] = 'mobile'
      "home/mobile/image-header"
    elsif request.user_agent.match? /\b(iPad)\b/i
      session[:device] = 'tablet'
      "home/talet/image-header"
    else
      session[:device] = 'desktop'
      "home/desktop/image-header"
    end
  end

  def all_categories
    @categories = Category.all
  end

  def nav_categories
    @all_categories = Category.all
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
