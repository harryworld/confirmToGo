class SendEmailJob < ActiveJob::Base
  queue_as :default

  def perform(participant)
    @participant = participant
    ConfirmMailer.new_participant_notification(@participant).deliver_later
  end
end
