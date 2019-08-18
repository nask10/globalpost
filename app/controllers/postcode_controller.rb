require 'postcode_api'

class PostcodeController < ApplicationController
  before_action :user_signed_in?

  # Get /postcode
  
  def postcode
  
  end

  # Post /lookup_postcode
 
  def lookup_postcode
    if params[:symbol].present?
      @response = Postcode::HTTP.ticker_data(params[:symbol].
        gsub(' ', '+').gsub(',',''))['results']
    end

    respond_to do |format|
      format.html
      format.json do
        render json: { result: @response }, status: :ok
      end
    end
  end

end