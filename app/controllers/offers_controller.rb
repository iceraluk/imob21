class OffersController < ApplicationController
  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @offers.to_json, :callback => params[:callback] }
    end
  end

  # GET /offers/new
  # GET /offers/new.jsonundefined b
  def new
    @offers = Offer.all
    @offer = Offer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @offer }
    end
  end

  # GET /offers/1/edit
  def edit
    @offers = Offer.all
    @offer = Offer.find(params[:id])
  end

  # POST /offers
  # POST /offers.json
  def create
    @offers = Offer.all
    @offer = Offer.new(params[:offer])

    respond_to do |format|
      if @offer.save(params[:offer])
        format.html { redirect_to offers_path, notice: 'Oferta a fost creata cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /offers/1
  # PUT /offers/1.json
  def update
    @offer = Offer.find(params[:id])

    respond_to do |format|
      if @offer.update_attributes(params[:offer])
        format.html { redirect_to offers_path, notice: 'Oferta a fost updatata cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer = Offer.find(params[:id])
    @offer.destroy

    respond_to do |format|
      format.html { redirect_to offers_path, notice: 'Oferta a fost stearsa cu success.' }
      format.json { head :no_content }
    end
  end
end