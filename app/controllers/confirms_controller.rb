class ConfirmsController < ApplicationController
  before_action :set_participant, except: [:start_all]
  before_action :set_event, only: [:start_all]

  def start_all
    @event.participants.signup.each do |p|
      p.status = Participant.statuses[:sent]
      if p.save
        SendEmailJob.set(wait: 2.seconds).perform_later(p)
      end
    end

    redirect_to event_url(@event)
  end

  def start
    @participant.status = Participant.statuses[:sent]

    @event = @participant.event

    respond_to do |format|
      if @participant.save
        SendEmailJob.set(wait: 2.seconds).perform_later(@participant)
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

    def set_event
      @event = Event.find(params[:event_id])
    end

end
