# frozen_string_literal: true

module MediaCommon
  extend ActiveSupport::Concern

  included do
    def tmdb
      @tmdb ||= TmdbInstance.new(tmdb_id: tmdb_id)
    end

    # ["w92", "w154", "w185", "w342", "w500", "w780", "original"]
    def poster_url(size)
      # tmdb.configuration.poster_sizes
      base_url = tmdb.configuration.base_url
      "#{base_url}/#{size}#{poster_path}"
    end

    # ["w300", "w780", "w1280", "original"]
    def backdrop_url(size)
      # tmdb.configuration.backdrop_sizes
      base_url = tmdb.configuration.base_url
      "#{base_url}/#{size}#{backdrop_path}"
    end

    private

    def tmdb_images
      @tmdb_images ||= Tmdb::Movie.images(tmdb_id)
    end
  end

  # rubocop:disable Metrics/BlockLength
  class_methods do
    # rubocop:disable Metrics/AbcSize
    # rubocop:disable Metrics/MethodLength
    def sanitize(str)
      cleanstr = str.dup
      cleanstr.gsub!(/-\s*/, '')
      cleanstr.gsub!(/\[?1080p\]?/i, '')
      cleanstr.gsub!(/m?\[?720p\]?/i, '')
      cleanstr.gsub!(/\[[^\]]+\]/, '')
      cleanstr.gsub!(/ECI/, '')
      cleanstr.gsub!(/EXTENDED/, '')
      cleanstr.gsub!(/UNRATED/, '')
      cleanstr.gsub!(/ETRG/, '')
      cleanstr.gsub!(/VPPV/, '')
      cleanstr.gsub!(/HQ/, '')
      cleanstr.gsub!(/\.web\./i, '')
      cleanstr.gsub!(/\.us\./i, '')
      cleanstr.gsub!(/x264xlf/i, '')
      cleanstr.gsub!(/x264trump/i, '')
      cleanstr.gsub!(/x264/, '')
      cleanstr.gsub!(/AAC5?\.?1?/, '')
      cleanstr.gsub!(/[\.\s]B[dr]Rip[\.\s]/i, '')
      cleanstr.gsub!(/\.Br\./i, '')
      cleanstr.gsub!(/BluRay/i, '')
      cleanstr.gsub!(/BOKUTOX/i, '')
      cleanstr.gsub!(/GAZ/, '')
      cleanstr.gsub!(/HDTV/i, '')
      cleanstr.gsub!(/WEBRip/i, '')
      cleanstr.gsub!(/(Deceit)?\.?YIFY/, '')
      cleanstr.gsub!(/YTS\.AM/, '')
      cleanstr.gsub!(/-?xvid-?/i, '')
      cleanstr.gsub!(/-?maxspeed/i, '')
      cleanstr.gsub!(/www\.torentz\.3xforum\.ro\.avi/i, '')
      cleanstr.gsub!(/-lol/i, '')
      cleanstr.gsub!(/\+HI/i, '')
      cleanstr.gsub!(/muxed/i, '')
      cleanstr.gsub!(/\(dvd\)/i, '')
      cleanstr.gsub!(/dvdscr/i, '')
      cleanstr.gsub!(/mkv/i, '')
      cleanstr.gsub!(/aqos/i, '')
      cleanstr.gsub!(/ac3/i, '')
      cleanstr.gsub!(/hive/i, '')
      cleanstr.gsub!(/-?cm8/i, '')
      cleanstr.gsub!(/[\d\.]+mb/i, '')
      cleanstr.gsub!(/[\d\.]+gb/i, '')
      cleanstr.gsub!(/\s\s+/, ' ')
      cleanstr.tr!('_', ' ') # underscores
      cleanstr.gsub!(/[\.\+]/, ' ')
      cleanstr.strip!
      cleanstr
    end
    # rubocop:enable Metrics/MethodLength
    # rubocop:enable Metrics/AbcSize

    def basename(filepath)
      File.basename(filepath, extname(filepath))
    end

    def extname(filepath)
      File.extname(filepath)
    end

    def dirname(filepath)
      File.dirname(filepath)
    end
  end
  # rubocop:enable Metrics/BlockLength
end
