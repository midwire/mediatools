# frozen_string_literal: true

FactoryBot.define do
  factory :tv_show do
    first_air_date { '2020-01-28' }
    homepage { 'MyString' }
    tmdb_id { 1 }
    in_production { false }
    last_air_date { '2020-01-28' }
    name { 'MyString' }
    next_episode_to_air { '2020-01-28' }
    number_of_episodes { 1 }
    number_of_seasons { 1 }
    origin_country { 'MyString' }
    original_language { 'MyString' }
    original_name { 'MyString' }
    overview { 'MyText' }
    popularity { 1.5 }
    status { 'MyString' }
    type { '' }
    vote_average { 1.5 }
    vote_count { 1 }
  end
end
