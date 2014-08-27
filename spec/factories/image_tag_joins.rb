# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :image_tag_join do

    factory :image_tag_join_dupe do
      after(:create) do |join|
        join.tag_id = 1
        join.image_id = 1
      end
    end
  end
end
