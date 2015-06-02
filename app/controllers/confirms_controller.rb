class ConfirmsController < ApplicationController
  before_action :set_participant

  def start
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

  def yes
    @participant.status = Participant.statuses[:replied]
    @participant.confirmed = true

    @participant.save
  end

  def no
    @participant.status = Participant.statuses[:replied]
    @participant.confirmed = false

    @participant.save
  end

  private
    def set_participant
      @participant = Participant.find(params[:id])
    end

end
