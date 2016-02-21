require 'thor'

module RomajiKit

  # Command-line interface of {RomajiKit}
  class CLI < Thor
    class_option :upcase, type: :boolean, aliases: '-u'

    desc 'hepburnize KANA', 'Convert kana to Hepburn romaji'

    # Convert kana to Hepburn romaji
    #
    # @param text [String] Kana text
    def hepburnize(text)
      puts Converter.hepburnize(text, options[:upcase])
    end

    desc 'nihon KANA', 'Convert kana to Nihon-shiki romaji'

    # Convert kana to Nihon-shiki romaji
    #
    # @param text [String] Kana text
    def nihon(text)
      puts Converter.nihon(text, options[:upcase])
    end

    desc '-v, --version', 'Print the version'
    map %w(-v --version) => :version

    # Print the version
    def version
      puts "romaji_kit #{RomajiKit::VERSION}"
    end
  end

  CLI.start
end
