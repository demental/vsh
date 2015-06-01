FactoryGirl.define do
  factory :user do
    email { generate :email }
    password 'sup3rsecr3t'
    password_confirmation 'sup3rsecr3t'
  end

end
