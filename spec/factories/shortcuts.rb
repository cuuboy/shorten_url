FactoryGirl.define do
  factory :shortcut do
    trait :with_short_url do
      short_url "test_short_url"
    end
  end
end
