# frozen_string_literal: true

require 'json'

class TmdbInstance
  attr_accessor :title, :year, :matches

  def initialize(title, year = nil)
    Tmdb::Api.key(api_key) # configure TMDB API key
    @title = title
    @year  = year
  end

  def movie?
    @matches = Tmdb::Movie.find(title)
    sleep(0.25)
    return self if matches.any?

    false
  end

  def to_h(index = 0)
    return nil unless matches.any?

    JSON.parse(matches[index].to_json)
  end

  private

  def api_key
    ENV.fetch('TMDB_KEY') do
      Settings.instance[:movies][:tmdb_key]
    end
  end
end
