class SendEmailAgainJob < ActiveJob::Base
  queue_as :default

  def perform(participant)
    @participant = participant

    participant.status = Participant.statuses[:sent_again]
    if participant.save
      ConfirmMailer.remind_participant_notification(@participant).deliver_later
    end
  end
end
