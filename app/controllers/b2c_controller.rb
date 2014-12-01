class B2cController < ApplicationController

  # GET /
  # GET /
  def index
    @offers = Offer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers.to_json, :callback => params[:callback] }
    end
  end

end