# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include ActiveJob::TestHelper, type: :job
  config.include FactoryGirl::Syntax::Methods
end
