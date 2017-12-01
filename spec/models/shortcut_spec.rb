require "rails_helper"

describe Shortcut, type: :model do
  describe 'validation' do
    it 'rejects wrong format url' do
      shortcut = build(:shortcut, original_url: 'test')

      shortcut.save

      expect(shortcut.errors.messages[:original_url]).not_to be_nil
    end
  end
end
