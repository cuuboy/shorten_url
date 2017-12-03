module V1
  module Entities
    class Shortcut < Grape::Entity
      expose :id
      expose :short_url
      expose :original_url
      expose :created_at

      expose :visits do |object, _|
        object.visits.order(created_at: :desc)
      end
    end
  end
end
