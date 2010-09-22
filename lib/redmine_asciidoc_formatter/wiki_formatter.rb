require 'redmine_asciidoc_formatter/asciidoc'

module RedmineAsciidocFormatter

  class WikiFormatter

    def initialize(text)
      @text = text
    end

    def to_html(&block)
      AsciiDoc.new(@text).to_html
    rescue => e
      return("<pre>problem parsing wiki text: #{e.message}\n"+
             "original text: \n"+
             @text+
             "</pre>")
    end

  end

end
