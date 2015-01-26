class MessageMailer < ActionMailer::Base
  default :from => "no-reply@imob21.ro"

  def send_message(message)
    @message = message

    email = message.offer.try(:admin).try(:email)

    if email
      mail(:to => email, :subject => "[IMOB21] Mesaj nou - oferta")
    else
      mail(:to => Admin::EMAILS, :subject => "[IMOB21] Mesaj nou - contact")
    end
  end
end