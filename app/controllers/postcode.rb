require 'postcode_api'

class PostcodeController < ApplicationController
    before_action :user_signed_in?

  # Get /postcode
  
  def index
    retrieve_data
    render "postcode/index"
  end

  # Get /postcode
 
  def show
  end
end