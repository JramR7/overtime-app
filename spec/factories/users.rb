FactoryGirl.define do
  sequence :email do |n|
    "test@test#{n}.com"
  end

  factory :user do
    first_name 'common'
    last_name 'user'
    email {generate :email}
    password 'testing1234'
    password_confirmation 'testing1234'
  end

  factory :admin_user, class: "AdminUser" do
    first_name 'Admin'
    last_name 'user'
    email {generate :email}
    password 'testing1234'
    password_confirmation 'testing1234'
  end
end