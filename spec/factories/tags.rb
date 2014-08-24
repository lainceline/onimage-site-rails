# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tag do
    name { Faker::Hacker.noun }

    factory :tag_with_images do
      after(:create) do |tag|
        total_images = rand(10)
        begin
            tag.images << FactoryGirl.build(:image)
            tag.num_images += 1
        end until tag.num_images == total_images
      end
    end

  end

end
