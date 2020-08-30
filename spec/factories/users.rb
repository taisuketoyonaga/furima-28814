FactoryBot.define do
  factory :user do
      nickname              {Faker::Name.name}
      email                 {"aaa@aaa"}
      password              {"a1aaaaa"}
      password_confirmation {password}
      family_name           {"あア阿"}
      first_name            {"あア阿"}
      family_name_reading   {"ア"}
      first_name_reading    {"ア"}
      birthday              {"1987-6-27"}
  end
end
