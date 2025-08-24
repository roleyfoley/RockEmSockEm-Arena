class Round < ApplicationRecord
  belongs_to :fight
  has_many :competitors, through: :round_entries

  before_validation :set_is_open, on: :create
  before_commit :set_round_number, on: :create

  scope :is_open, -> { joins(:fight).where("number = 1").merge(Fight.pending) }

  private
    def set_round_number
      self.number = (self.fight.rounds.order(number: :asc).first.number || 0) + 1
    end

    def get_competitors

    end
end
