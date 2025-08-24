class Competitor < ApplicationRecord
  has_many :rounds, through: :round_entries

  validates_presence_of :instance_id
  before_validation :generate_name, on: :create
  after_save :check_health

  private
    def generate_name
      self.name = Faker::Games::StreetFighter.character if name.blank?
    end

    def check_health
      CompetitorCheckJob.perform_later self
    end
end
