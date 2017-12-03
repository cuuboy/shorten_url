require "rails_helper"

describe ShortcutsController, type: :controller do
  describe 'redirect' do
    it 'redirect correctly' do
      shortcut = create(
        :shortcut,
        :with_short_url,
        original_url: 'http://www.shortcut.idv'
      )

      get :redirect, params: { id: shortcut.id, short_url: shortcut.short_url }

      response.should redirect_to shortcut.original_url
    end

    it 'creates visit entity when making redirect' do
      shortcut = create(
        :shortcut,
        :with_short_url,
        original_url: 'http://www.shortcut.idv'
      )

      get :redirect, params: { id: shortcut.id, short_url: shortcut.short_url }

      expect(shortcut.visits.count).to be(1)
    end

    it 'creates visit with request content' do
      shortcut = create(
        :shortcut,
        :with_short_url,
        original_url: 'http://www.shortcut.idv'
      )

      allow_any_instance_of(ActionDispatch::Request).
        to receive(:remote_ip).and_return('192.168.0.1')

      get :redirect, params: { id: shortcut.id, short_url: shortcut.short_url }

      visit = Visit.last
      expect(visit.ip).to eq('192.168.0.1')
      byebug
    end
  end

  def shorten_url_service
    ShortenUrlService
  end
end
