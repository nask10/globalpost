require 'postcode_api'

class PostcodeController < ApplicationController
    before_action :user_signed_in?

  # GET /postcode
  
  def index
    retrieve_data
    render "postcode/index"
  end

  # GET /postcode
 
  def show
  end
end