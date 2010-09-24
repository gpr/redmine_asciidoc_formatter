require 'redmine_asciidoc_formatter/asciidoc'

module RedmineAsciidocFormatter

  class WikiFormatter

    def initialize(text)
      @text = text
    end

    def to_html(&block)
      conf = File.join(RAILS_ROOT,'vendor','plugins','redmine_asciidoc_formatter','lib','redmine_asciidoc_formatter','redmine.conf')
      arg = "--conf-file="+conf
      AsciiDoc.new(@text).to_html(arg)
    rescue => e
      return("<pre>problem parsing wiki text: #{e.message}\n"+
             "original text: \n"+
             @text+
             "</pre>")
    end

  end

end
