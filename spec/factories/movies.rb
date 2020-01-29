# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    adult { false }
    budget { 1 }
    homepage { 'MyString' }
    tmdb_id { 1 }
    imdb_id { 'MyString' }
    original_language { 'MyString' }
    original_title { 'MyString' }
    overview { 'MyText' }
    popularity { 1.5 }
    release_date { '2020-01-28' }
    revenue { 1 }
    runtime { 1 }
    status { 'MyString' }
    tagline { 'MyString' }
    title { 'MyString' }
    video { false }
    vote_average { 1.5 }
    vote_count { 1 }
  end
end
