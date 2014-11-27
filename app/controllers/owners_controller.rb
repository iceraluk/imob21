class OwnersController < ApplicationController
  before_filter :authenticate_admin!

  # GET /owners
  # GET /owners.json
  def index
    @owners = Owner.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owners.to_json, :callback => params[:callback] }
    end
  end

  # GET /owner/1
  # GET /owner/1.json
  def show
    @owner = Owner.find(params[:id])
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @owner.to_json, :callback => params[:callback] }
    end
  end

  # GET /owners/new
  # GET /owners/new.jsonundefined b
  def new
    @owner = Owner.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @owner }
    end
  end

  # GET /owners/1/edit
  def edit
    @owner = Owner.find(params[:id])
  end

  # POST /owners
  # POST /owners.json
  def create
    @owner = Owner.new(params[:owner])

    respond_to do |format|
      if @owner.save(params[:owner])
        format.html { redirect_to owners_path, notice: 'Oferta a fost creata cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /owners/1
  # PUT /owners/1.json
  def update
    @owner = Owner.find(params[:id])

    respond_to do |format|
      if @owner.update_attributes(params[:owner])
        format.html { redirect_to owners_path, notice: 'Oferta a fost updatata cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @owner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /owners/1
  # DELETE /owners/1.json
  def destroy
    @owner = Owner.find(params[:id])
    @owner.destroy

    respond_to do |format|
      format.html { redirect_to owners_path, notice: 'Oferta a fost stearsa cu success.' }
      format.json { head :no_content }
    end
  end
end