FactoryBot.define do
  factory :purchase_address do
    post_number { '123-4567' }
    shipmentsource_id { 2 }
    si { '市' }
    banti { '番地' }
    building { '建物' }
    phone { '00033334444' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
