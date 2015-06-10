class Participant < ActiveRecord::Base
  enum status: [:signup, :sent, :replied, :sent_again]
  belongs_to :event
end
