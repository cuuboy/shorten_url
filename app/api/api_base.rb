class ApiBase < Grape::API
  prefix 'api'
  content_type :json, 'application/json'

  mount V1::ApiBase
end
