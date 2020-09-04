FactoryBot.define do
  factory :reflection do
    start_time  { Date.today }
    impression  { "楽しかった" }
    association :user
  end
end
