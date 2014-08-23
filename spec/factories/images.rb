# Read about factories at https://github.com/thoughtbot/factory_girl
require 'faker'

FactoryGirl.define do
  factory :image do
    title { Faker::Hacker.noun + ' ' + Faker::Hacker.ingverb }
    original_filename { Faker::Company.logo }
    uploaded_filename { Faker::Code.ean + ".jpg" }

    factory :image_with_tags do
      after(:create) do |image|
        total_tags = rand(20)
        begin
          image.tags << FactoryGirl.create(:tag)
          image.num_tags += 1
          end until image.num_tags == total_tags
      end
    end

    factory :image_with_comments do
      after(:create) do |image|
        total_comments = rand(20)
        begin
          image.comments << FactoryGirl.build(:comment)
          total_comments = total_comments - 1
        end until total_comments == 0
      end
    end

  end
end
