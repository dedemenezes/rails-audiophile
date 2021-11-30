class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  before_action :all_categories, :find_user_cart

  def home
    @banner_image_url = banner_image
    @banner_product = Product.find_by(name: 'XX99 Mark II Headphones')
    @top_two = Product.top_two
    # binding.pry
    @top_earphone = Category.top_earphone
  end

  def geocode_address
    binding.pry
    @results = Geocoder.search(params[:address]).map do |result|
      { lat: result.latitude,
        lon: result.longitude
      }
    end
    respond_to do |format|
      if @results.present?
        format.js { render json: @results }
      else
        format.js { render json: "no address rsrs zo/" }
      end
    end
  end
end
