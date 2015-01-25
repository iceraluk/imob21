class MessageMailer < ActionMailer::Base
  default :from => "no-reply@imob21.ro"

  def send_message(message)
    @message = message

    email = message.offer.try(:admin).try(:email)

    if email
      mail(:to => email, :subject => "[IMOB21] Mesaj nou")
    else
      mail(:to => 'iulia@ionita.me', :subject => "[ERROR - IMOB21] Mesajul nu a fost trimis")
    end
  end
end