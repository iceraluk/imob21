class ClientsController < ApplicationController
  before_filter :authenticate_admin!

  # GET /clients
  # GET /clients.json
  def index
    @clients = Client.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clients.to_json, :callback => params[:callback] }
    end
  end

  # GET /clients/new
  # GET /clients/new.jsonundefined b
  def new
    @client = Client.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])

    respond_to do |format|
      if @client.save(params[:client])
        format.html { redirect_to clients_path, notice: 'Clientul a fost creat cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "new" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to clients_path, notice: 'Clientul a fost updatat cu success.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_path, notice: 'Clientul a fost stears cu success.' }
      format.json { head :no_content }
    end
  end
end