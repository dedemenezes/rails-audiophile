class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_cart, :all_categories
  include Pundit

  # Pundit: allowlist approach.
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def get_banner_image
    
    if request.user_agent.match? /\b(Android|iPhone|iPad|Windows Phone|Opera Mobi|Kindle|BackBerry|PlayBook)\b/i
      session[:device] = 'mobile'
      Cloudinary::Utils.cloudinary_url('mobile-banner-image')
    else
      session[:device] = 'desktop'
      Cloudinary::Utils.cloudinary_url('destktop-banner-image')
    end
  end

  def set_cart
    @cart = Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @cart = Cart.create
    session[:cart_id] = @cart.id
    @cart
  end

  def all_categories
    @categories = Category.all
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
