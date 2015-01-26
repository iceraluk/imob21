class MessagesController < ApplicationController

  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    if @message.offer
      redirect_link = b2c_offer_path(@message.offer, :anchor => "contact")
    else
      redirect_link = b2c_contact_path(:anchor => "contact")
    end
    respond_to do |format|
      if @message.save(params[:message])
        MessageMailer.send_message(@message).deliver
        format.html { redirect_to redirect_link, notice: 'Multumim pentru mesaj. Agentul va fi in contact cu dumoneavostra cat mai curand' }
        format.json { head :no_content }
      else
        format.html { redirect_to redirect_link, notice: 'Mesajul nu a putut fi trimis. Va rugam mai incercati o data.' }
        format.json { head :no_content }
      end
    end
  end

end