FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              {'1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    firstname             { '有木' }
    familyname            { '山田' }
    firstname_two         { 'ユウキ' }
    familyname_two        { 'ヤマダ' }
    birthday              { '2020-01-01' }
  end
end
