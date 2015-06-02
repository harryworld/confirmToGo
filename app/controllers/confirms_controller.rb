class ConfirmsController < ApplicationController

  def start
    @participant = Participant.find(params[:id])
    @participant.status = Participant.statuses[:sent]
    @participant.confirmed = false

    @event = @participant.event

    respond_to do |format|
      if @participant.save
        ConfirmMailer.new_participant_notification(@participant).deliver
        format.html { redirect_to event_url(@event), notice: 'Participant was notified.' }
      else
        format.html { redirect_to event_url(@event), notice: 'Error sending email.' }
      end
    end

  end

end
