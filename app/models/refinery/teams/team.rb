module Refinery
  module Teams
    class Team < Refinery::Core::BaseModel
      extend FriendlyId

      self.table_name = 'refinery_teams'

      translates :job_title, :body

      validates :fullname, :presence => true, :uniqueness => true
      alias_attribute :title, :fullname

      belongs_to :photo, :class_name => '::Refinery::Image'

      has_many :categorizations, :dependent => :destroy, :foreign_key => :team_id
      has_many :categories, :through => :categorizations, :source => :teams_category

      acts_as_indexed :fields => [:fullname]

      scope :published, -> { where :draft => false }

      default_scope { order(position: :asc) }

      friendly_id :fullname, use: [:slugged, :finders]

      class << self
        def uncategorized
          published.includes(:categories).where(
            Refinery::Teams::Categorization.table_name => { :teams_category_id => nil }
          )
        end
      end
    end
  end
end
