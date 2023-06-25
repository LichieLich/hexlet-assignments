# frozen_string_literal: true

class Repository < ApplicationRecord
  validates :link, presence: true, uniqueness: true

  # BEGIN
  include AASM

  aasm whiny_transitions: false do
    state :created, initial: true
    state :fetching, :fetched, :failed

    event :start_fetching do
      transitions from: :created, to: :fetching
    end

    event :fetching_complete do
      transitions from: :fetching, to: :fetched
    end

    event :fail do
      transitions from: :fetching, to: :failed
    end
  end
  # END
end
