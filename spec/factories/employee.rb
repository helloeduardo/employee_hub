FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.email }
    department { Faker::Commerce.department }
    salary { rand(45..130) * 1000 }
    annual_bonus { rand(1..9) * 1000 }
    vacation_balance { Faker::Number.decimal(l_digits: 3, r_digits: 1) }

    trait :with_manager do
      manager_id { create(:employee).id }
    end

    factory :manager do
      role { 2 }
    end

    factory :admin do
      role { 3 }
    end
  end
end
