class Participant < ActiveRecord::Base
  enum status: [:join, :sent, :replied]
  belongs_to :event
end
