# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :image do
    title { Faker::Hacker.noun + ' ' + Faker::Hacker.ingverb }
    original_filename { Faker::Company.logo }
    uploaded_filename { Faker::Code.ean + ".jpg" }

    factory :image_with_tag do
      after_create do |image|
        create(:tag, image: image)
      end
    end

  end
end
