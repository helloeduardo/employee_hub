FactoryBot.define do
  factory :employee do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    password { Faker::Internet.email }
    department { Faker::Commerce.department }
    salary { rand(45..130) * 1000 }
    vacation_balance { Faker::Number.decimal(l_digits: 3, r_digits: 1) }
  end
end
