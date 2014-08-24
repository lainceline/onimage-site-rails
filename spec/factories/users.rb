# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }

    factory :user_with_images do
      after(:create) do |user|
        for i in 0..rand(20)
          user.images << FactoryGirl.build(:image)
        end
      end

    end
  end
end
