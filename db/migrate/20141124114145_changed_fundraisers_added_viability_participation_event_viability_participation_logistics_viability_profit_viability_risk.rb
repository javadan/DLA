class ChangedFundraisersAddedViabilityParticipationEventViabilityParticipationLogisticsViabilityProfitViabilityRisk < ActiveRecord::Migration
  def self.up
    add_column :fundraisers, :viability_participation_event, :text
    add_column :fundraisers, :viability_participation_logistics, :text
    add_column :fundraisers, :viability_profit, :text
    add_column :fundraisers, :viability_risk, :text
  end
  
  def self.down
    remove_column :fundraisers, :viability_participation_event
    remove_column :fundraisers, :viability_participation_logistics
    remove_column :fundraisers, :viability_profit
    remove_column :fundraisers, :viability_risk
  end
end
