FactoryBot.define do
  factory :user do
    sequence :name do |n|
      "User#{n}"
    end

    sequence :email do |n|
      "user#{n}@user.com"
    end

    password { 'password' }
  end
end
