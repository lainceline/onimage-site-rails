# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }

    factory :user_with_images do
      after(:create) do |user|
        total_images = rand(20)
        begin
          user.images << FactoryGirl.create(:image)
          total_images = total_images - 1
        end until total_images == 0
      end

    end
  end
end
