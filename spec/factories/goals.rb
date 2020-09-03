FactoryBot.define do
  factory :goal do
    name        { "健康" }
    point       { 10 }
    association :user
  end
end
