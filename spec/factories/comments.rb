# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :comment do
    text { Faker::Hacker.say_something_smart }

    factory :comment_with_user_and_image do
      association :user, factory: :user
      association :image, factory: :image
    end

  end

end
