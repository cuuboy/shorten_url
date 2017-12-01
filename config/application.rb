require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ShortenUrl
  class Application < Rails::Application
    config.load_defaults 5.1

    autoload_paths = %w(
      app/services
    )

    autoload_paths.each do |autoload_path|
      puts "Load #{autoload_path}"
      config.eager_load_paths << Rails.root.join(autoload_path)
    end
  end
end
