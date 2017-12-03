module V1
  module Support::ErrorHandler
    extend ActiveSupport::Concern

    def self.call(message, _backtrace, _options, _env)
      { error: message }.to_json
    end

    included do
      version 'v1'
      format :json

      rescue_from Grape::Exceptions::ValidationErrors do |e|
        error_response(status: 400, message: e.message)
      end

      rescue_from ActiveRecord::RecordNotFound do |e|
        error_response(status: 404, message: e.message)
      end

      rescue_from ActiveRecord::RecordInvalid do |e|
        error_response(status: 422, message: e.message)
      end

      rescue_from :all do |e|
        if Rails.env.test?
          error_response(backtrace: e.backtrace[0..5], message: e.message, status: 500)
        elsif Rails.env.development?
          raise e
        else
          error_response(message: 'Internal server error', status: 500)
        end
      end
    end
  end
end
