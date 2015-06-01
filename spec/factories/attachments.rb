FactoryGirl.define do
  factory :attachment do
    media_container
    file File.open(Rails.root.join('spec/fixtures/image.png'))
  end
end
