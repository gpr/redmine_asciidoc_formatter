require 'redmine_asciidoc_formatter/asciidoc'

module RedmineAsciidocFormatter::WikiFormatting
  class Formatter
    #    include ActionView::Helpers::TagHelper

    def initialize(text)
      @text = text
    end

    def to_html(&block)
      arg = ""

      @text.gsub!(/([\{\}]){2}/, '%%\1%%')

      if @text.match(':toc:')
        arg = "-a toc "
      end

      conf = File.join(RedmineAsciidocFormatter.root, 'lib', 'redmine_asciidoc_formatter', 'redmine.conf')
      arg += "--conf-file="+conf

      html = AsciiDoc.new(@text).to_html(arg)
      html.gsub!(/%%([\{\}])%%/, '\1\1')
      html.gsub(/wiki:(\w+(\/\w+)*)/, '[[\1]]')
    end
  end
end