class ContactMailer < ApplicationMailer
  def new_contact_message
    @message = params[:message]

    mail(to: 'nowyswit.kontakt@gmail.com', subject: "SongGuesser - New message")
  end
end
