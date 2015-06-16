class SendEmailCouponJob < ActiveJob::Base
  queue_as :default

  def perform(participant)
    @participant = participant

    ConfirmMailer.send_coupon_notification(@participant).deliver_later
  end
end
