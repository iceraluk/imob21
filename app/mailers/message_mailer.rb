class MessageMailer < ActionMailer::Base
  default :from => "no-reply@imob21.ro"

  def send_message(message)
    @message = message
    mail(:to => message.agent.email, :subject => "[IMOB21] Mesaj nou")
  end
end