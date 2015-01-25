class AdminsController < ApplicationController
  before_filter :authenticate_admin!

  def index
    @admins = Admin.all_ordered
  end

  def new
    @admin  = Admin.new
  end

  def edit
    @admin = Admin.find(params[:id])
  end

  def create
    @admin = Admin.new(params[:admin])
    respond_to do |format|
      if @admin.save
        format.html { redirect_to admins_path, notice: 'Adminul a fost creat cu success.' }
        format.json { render json: @admin, status: :created, location: @admin }
      else
        format.html { render action: "new", error: 'Admin nu a putut fi creat/' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @admin = Admin.find(params[:id])
    if params[:admin][:password].blank?
      [:password,:password_confirmation,:current_password].collect{|p| params[:admin].delete(p) }
    else
      @admin.errors[:base] << "Parola este incorecta" unless @admin.valid_password?(params[:admin][:current_password])
    end

    respond_to do |format|
      if @admin.errors[:base].empty? and @admin.update_attributes(params[:admin])
        format.html { redirect_to admins_path, notice: 'Adminul a fost actualizat.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end

  end

end