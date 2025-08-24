class Fight < ApplicationRecord
  has_many :rounds, dependent: :destroy

  enum :status, [ :pending, :in_progress, :finished ], default: :pending

  validates_presence_of :name

  before_validation :generate_name, on: :create
  before_validation :set_starts_at, on: :create
  after_commit :setup_fight, on: :create

  private
    def setup_fight
      FightsSetupJob.perform_later self
    end

    def set_starts_at
      self.starts_at = created_at + 2.minutes
    end

    def generate_name
      verbs = [ "rumble", "battle", "knock", "brawl", "wallop", "whack", "skirmish", "joust" ]
      locations = [ "jungle", "desert", "snow", "data centre", "forrest", "china shop" ]
      self.name = "The #{verbs.sample} in the #{locations.sample}".titleize if name.blank?
    end
end
