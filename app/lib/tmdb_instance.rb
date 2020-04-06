# frozen_string_literal: true

require 'json'

class TmdbInstance
  include ActiveModel::Validations

  attr_accessor :title, :year, :matches, :tmdb_id, :configuration

  validate :give_me_something

  def initialize(attrs = {})
    Tmdb::Api.key(api_key) # configure TMDB API key
    @title         = attrs[:title]
    @year          = attrs[:year]
    @tmdb_id       = attrs[:tmdb_id]
    @configuration = Tmdb::Configuration.new
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

  def give_me_something
    errors.add(:base, 'We need a title or the tmdb_id at a minimum.') if title.blank? && tmdb_id.blank?
  end
end
