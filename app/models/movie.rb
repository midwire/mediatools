# frozen_string_literal: true

class Movie < ApplicationRecord
  include MediaCommon

  after_initialize :initialize_tmdb

  validates :title, presence: true

  class << self
    # Determine if the passed file is most likely a Movie.
    # If it is, that usually means the file was named with movie title and
    # year somwehere in the filename
    #
    # @return [Boolean] TmdbInstance if likely a Movie, false if not
    def match?(filepath)
      base          = basename(filepath)
      possible_year = possible_year_in_title(base)
      clean_title   = sanitize(base).gsub(/[\s\.\-\_]\(?\d+\s*\)?$/, '')
      tmdb_instance = TmdbInstance.new(title: clean_title, year: possible_year)
      return tmdb_instance if tmdb_instance.movie?

      false
    end

    # Instantiate an instance based on the API call
    #
    # @param filepath [String] Path to the file on disk
    # @param tmdb_instance [TmdbInstance] An instance with at least one match
    # @return [Movie] An instance of Movie
    def instance(filepath, tmdb_instance)
      data = tmdb_instance.to_h
      data['tmdb_id'] = data.delete('id') # Rename the TMDB id
      exclude_attribs = data.keys - attribute_names
      create(data.except(*exclude_attribs).merge(filepath: filepath))
    rescue ActiveRecord::RecordNotUnique => _err
      # It is a duplicate so swallow it
    end

    private

    def possible_year_in_title(title)
      title_with_year = sanitize(title)
      md = title_with_year.match(/(\d{4}+)/)
      md ? md[1] : nil
    end
  end

  private

  def initialize_tmdb
    tmdb
  end
end
