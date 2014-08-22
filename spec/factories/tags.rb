# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name { Faker::Hacker.noun }

    factory :tag_with_image do
      after_create do |tag|
        create(:image, tag: tag)
      end
    end

  end
end
