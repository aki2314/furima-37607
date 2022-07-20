FactoryBot.define do
  factory :purchase do
    post_number { 123 - 4567 }
    shipmentsource_id { 2 }
    si { '市' }
    banti { '番地' }
    building { '建物' }
    phone { 0o0033334444 }
  end
end
