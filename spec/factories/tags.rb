# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name { Faker::Hacker.noun }

    factory :tag_with_images do
      after(:create) do |tag|
        total_images = rand(10)
        begin
            tag.images << FactoryGirl.build(:image)
            total_images = total_images - 1
        end until total_images == 0
      end
    end

  end

end
