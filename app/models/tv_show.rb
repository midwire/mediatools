# frozen_string_literal: true

class TvShow < ApplicationRecord
  include MediaCommon

  S_E_EXPRESSIONS = [
    /(s(\d+)e(\d+))/i,
    /((\d+)x(\d+))/i
  ].freeze

  class << self
    def match?(filepath)
      index = nil
      clean_title = nil
      base = basename(filepath)
      sanitized = sanitize(base)
      S_E_EXPRESSIONS.each do |regex|
        next unless (md = sanitized.match(regex))

        index = sanitized.index(md[1], 0)
        clean_title = sanitized[0..index - 1].strip
        break
      end
      return false unless clean_title

      tmdb_instance = TmdbInstance.new(clean_title)
      return tmdb_instance if tmdb_instance.tv_show?

      false
    end
  end
end
