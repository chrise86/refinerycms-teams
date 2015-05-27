module Refinery
  module Teams
    include ActiveSupport::Configurable

    config_accessor :page_url

    self.page_url = "/team"
  end
end