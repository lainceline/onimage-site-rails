# Read about factories at https://github.com/thoughtbot/factory_girl

require 'faker'

FactoryGirl.define do
  factory :comment do
    text { Faker::Hacker.say_something_smart }
  end
end
