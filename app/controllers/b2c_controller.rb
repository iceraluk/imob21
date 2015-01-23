class B2cController < ApplicationController

  # GET /
  # GET /
  def index
    @offers = Offer.all_ordered_and_active.paginate(:page => params[:page], :per_page => 20)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers.to_json, :callback => params[:callback] }
    end
  end

  def oferta
    @offer = Offer.find_by_id(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offer.to_json, :callback => params[:callback] }
    end
  end

  def listare_oferte
    @offers = Offer.search(params)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers.to_json, :callback => params[:callback] }
    end
  end

end