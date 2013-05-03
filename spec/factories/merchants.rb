# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :merchant do
    name "Merchant"
    #store

    factory :cafepress do
      name "CafePress"
    end

    factory :zazzle do
      name "Zazzle"
    end

    factory :spreadshirt do
      name "Spreadshirt"
    end
  end
end
