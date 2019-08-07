require 'postcode_api'

class PostcodeController < ApplicationController
    before_action :user_signed_in?

  # Get /postcode
  
  def postcode
  
  end

  # Get /postcode
 
  def lookup_postcode
    @response = Postcode::HTTP.ticker_data(params[:symbol].
      gsub(' ', '+').gsub(',',''))['results']
  end

end