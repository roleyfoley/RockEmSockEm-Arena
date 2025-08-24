class FightsSetupJob < ApplicationJob
  queue_as :default

  def perform(fight)
    if Fight.in_progress.exists? && !fight.pending?
      nil
    end

    fight.in_progress!

    round = fight.rounds.nil? ? fight.rounds.create! : fight.rounds.order(number: :desc).first
    round.is_open = True
    round.save!
  end
end
