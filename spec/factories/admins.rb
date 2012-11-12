FactoryGirl.define do
  factory :admin do |admin|
    admin.name 'Admin'
    admin.email 'admin@example.com'
    admin.password 'password'
    admin.password_confirmation 'password'
  end
end
