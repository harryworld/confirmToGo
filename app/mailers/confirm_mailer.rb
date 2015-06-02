class ConfirmMailer < ApplicationMailer

  default from: "harry@reque.st"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.confirm_mailer.new_participant_notification.subject
  #
  def new_participant_notification(participant)
    @participant = participant
    @greeting = "Hi"

    mail to: @participant.email, subject: 'AngelHack - 3D Printing Workshop'
  end
end
