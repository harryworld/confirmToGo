class ConfirmMailer < ApplicationMailer

  default from: "Harry Ng - AngelHack <harry@reque.st>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_participant_notification.subject
  #
  def new_participant_notification(participant)
    @participant = participant
    @pid = @participant.id
    @name = @participant.name
    @greeting = "Hi"

    mail to: "#{@name} <#{@participant.email}>", subject: 'AngelHack - 3D Printing Workshop'
  end
end
