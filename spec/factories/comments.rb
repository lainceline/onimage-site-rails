# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :comment do
    text { Faker::Hacker.say_something_smart }

    factory :comment_with_user do
      association :user, factory: :user
    end

  end

end
