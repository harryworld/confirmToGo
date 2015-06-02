class Participant < ActiveRecord::Base
  enum status: [:signup, :sent, :replied]
  belongs_to :event
end
