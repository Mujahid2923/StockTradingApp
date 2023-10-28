# frozen_string_literal: true

require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module StockTradingApp
  class Application < Rails::Application # rubocop:disable Style/Documentation
    config.load_defaults 6.1

    config.eager_load_paths << Rails.root.join('lib')
    config.eager_load_paths << Rails.root.join('permissions/*')
  end
end
