require "rails_helper"

describe ShortcutsController, type: :controller do
  describe 'redirect' do
    it 'redirect correctly' do
      shortcut = build(:shortcut, original_url: 'http://www.shortcut.idv')
      shortcut.short_url = shorten_url_service.call(shortcut.original_url)
      shortcut.save

      get :redirect, params: { id: shortcut.id, short_url: shortcut.short_url }

      response.should redirect_to shortcut.original_url
    end
  end

  def shorten_url_service
    ShortenUrlService
  end
end
