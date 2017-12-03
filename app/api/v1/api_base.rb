module V1
  class ApiBase < Grape::API
    include V1::Support::ErrorHandler

    version 'v1'
    format :json
    error_formatter :json, V1::Support::ErrorHandler

    # Note: Sequence-sensitive
    mount V1::Shortcuts

    add_swagger_documentation
  end
end
