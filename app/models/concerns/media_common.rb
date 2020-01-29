# frozen_string_literal: true

module MediaCommon
  extend ActiveSupport::Concern

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
