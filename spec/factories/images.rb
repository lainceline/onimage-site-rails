# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :image do
    title { Faker::Hacker.noun + ' ' + Faker::Hacker.ingverb }
    original_filename { Faker::Company.logo }
    uploaded_filename { Faker::Code.ean + ".jpg" }

    factory :image_with_tags do
      after(:create) do |image|
        for i in 0..rand(20)
          image.tags << FactoryGirl.build(:tag)
        end
      end
    end

    factory :image_with_comments do
      after(:create) do |image|
        for i in 0..rand(20)
          image.comments << FactoryGirl.build(:comment)
        end
      end
    end

  end
end
