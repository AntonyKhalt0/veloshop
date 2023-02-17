# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Veloshop
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.time_zone = 'Moscow'

    config.i18n.available_locales = %i[en ru]
    config.i18n.default_locale = :ru

    config.autoload_paths += [config.root.join('app')]

    config.action_cable.disable_request_forgery_protection = false

    config.generators do |g|
      g.test_framework :rspec,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false,
                       request_specs: false
    end
  end
end
