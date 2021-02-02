FactoryBot.define do
  factory :watch_party do
    movie_title { "MyString" }
    date { "MyString" }
    time { "MyString" }
    duration { 1 }
    user { nil }
  end
end
