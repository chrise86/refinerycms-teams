class AddQualificationsToTeams < ActiveRecord::Migration
  def change
    add_column :refinery_teams, :qualifications, :string
  end
end
