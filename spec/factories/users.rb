FactoryBot.define do
  factory :user, class: User do
    name {'juan'}
    email {'j@gmail.com'}
    password {'123456'}
  end
end