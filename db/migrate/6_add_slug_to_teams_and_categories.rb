class AddSlugToTeamsAndCategories < ActiveRecord::Migration
  def up
    add_column :refinery_teams, :slug, :string
    add_index :refinery_teams, :slug

    add_column :refinery_teams_categories, :slug, :string
    add_index :refinery_teams_categories, :slug
  end

  def down
    remove_column :refinery_teams, :slug
    remove_column :refinery_teams_categories, :slug
  end
end