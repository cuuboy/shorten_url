module V1
  class Shortcuts < Grape::API
    resource :shortcuts do
      desc 'Get shortcut by short url'
      params do
        requires :short_url, type: String
      end
      get ':short_url' do
        shortcut = Shortcut.find_by(short_url: params[:short_url])

        present shortcut, with: Entities::Shortcut
      end
    end
  end
end