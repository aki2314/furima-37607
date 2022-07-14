FactoryBot.define do
  factory :item do

    name              { '山' }
    detail            { '谷' }
    category_id       { 2 }
    status_id         { 2 }
    shipmentsource_id { 2 }
    price             { 300 }
    derivalyprice_id  { 2 }
    derivalyday_id    { 2 }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/IMG20220114054408.jpg'), filename: 'IMG20220114054408.jpg')
    end
  end
end
