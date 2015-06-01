FactoryGirl.define do
  factory :media_container do
    kind "image"
    source nil
    user
    title "My favourite landscape"
    description "This is the picture of my favourite landscape"
  end
end
