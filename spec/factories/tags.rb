# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name { Faker::Hacker.noun }

    factory :tag_with_images do
      after(:create) do |tag|
        for i in 0..rand(20)
            tag.images << FactoryGirl.build(:image)
        end
      end
    end

  end

end
