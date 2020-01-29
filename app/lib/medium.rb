# frozen_string_literal: true

require 'filemagic'

# Common functionality for all Movies and TV Shows and factory for
# Move and TvShow
class Medium
  attr_accessor :filename, :target

  MIME_TYPES = %w[
    video/mp4
    video/ogg
    video/webm
    video/mpeg
    video/quicktime
    video/x-matroska
    video/x-msvideo
  ].freeze
  OCTET_STREAM_EXTENSIONS = %w[.3gp .mp4].freeze
  IGNORED_EXTENSIONS = %w[
    .aup
    .dmg
    .docx
    .gif
    .html
    .jpg
    .part
    .pdf
    .png
    .vcf
    .wav
    .zip
  ].freeze

  class << self
    # Determine if a file is a processable media file
    #
    # @return [Boolean] true if file is processable, false if not
    def media_file?(filepath)
      return false if File.directory?(filepath)
      return false if IGNORED_EXTENSIONS.include?(File.extname(filepath).downcase)

      Rails.logger.debug { "checking: #{filepath}" }

      mime = mime_type(filepath)

      return true if
        mime == 'application/octet-stream' &&
        OCTET_STREAM_EXTENSIONS.include?(File.extname(filepath))

      MIME_TYPES.include?(mime)
    end

    # Build the proper instance of a child class. This method does not check if
    # the file is of the proper mime-type. Use media-file for that
    #
    # @param filepath [String] full path to the file
    # @return [Medium] instance of the corresponding class type
    def build_instance(filepath)
      return nil unless media_file?(filepath)

      tvdb_instance = TvShow.match?(filepath)
      return TvShow.instance(filepath, tvdb_instance) if tvdb_instance

      tmdb_instance = Movie.match?(filepath)
      return Movie.instance(filepath, tmdb_instance) if tmdb_instance

      nil
    end

    private

    def mime_type(filepath)
      file_magic ||= FileMagic.mime
      mime_str = file_magic.file(filepath.to_s)
      mime_str.split(/;/).first
    end
  end
end
