# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "Mug"
    description "Something"
    category "Something"
    price "12.00"
    active true
    sequence(:unique_id) {|n| n.to_s}
    merchant
  end
end
