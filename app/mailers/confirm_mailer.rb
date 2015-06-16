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
    @event_name = @participant.event.name
    @start_time = @participant.event.start_time.to_formatted_s(:long)

    mail to: "#{@name} <#{@participant.email}>", subject: "Confirmation Needed: #{@event_name}"
  end

  def remind_participant_notification(participant)
    @participant = participant
    @name = @participant.name
    @event_name = @participant.event.name
    @start_time = @participant.event.start_time.to_formatted_s(:long)

    mail to: "#{@name} <#{@participant.email}>", subject: "Remind to bring your Mac: #{@event_name}"
  end

  def send_coupon_notification(participant)
    @participant = participant
    @name = @participant.name
    @event_name = @participant.event.name
    @start_time = @participant.event.start_time.to_formatted_s(:long)

    mail to: "#{@name} <#{@participant.email}>", subject: "AngelHack FREE code. Thanks in joining #{@event_name}"
  end
end
