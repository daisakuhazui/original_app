require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module OriginalApp
  class Application < Rails::Application
    config.load_defaults 5.1

    config.generators do |g|
      g.test_framework false
      g.helper false
      g.javascripts false
      g.stylesheets false
    end

    config.assets.precompile += %w(*.png *.jpg *.jpeg *.gif)
  end
end
