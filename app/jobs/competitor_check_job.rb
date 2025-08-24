class CompetitorCheckJob < ApplicationJob
  queue_as :default

  def perform(competitor)
    if SSM_COMPLIANCE_MANAGER.is_instance_compliant(competitor.instance_id) &&
      competitor.rounds.nil? &&
      Round.is_open.exists?
        Round.is_open.first.competitors.concat(competitor).save!
    end
  end
end
