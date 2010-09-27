require 'redmine_asciidoc_formatter/asciidoc'

module RedmineAsciidocFormatter

  class WikiFormatter

    def initialize(text)
      @text = text
    end

    def to_html(&block)
      arg = ""
      
      @text.gsub!(/([\{\}]){2}/, '%%\1%%')
      
      if @text.match(':toc:')
        arg = "-a toc " 
      end
      
      conf = File.join(RAILS_ROOT,'vendor','plugins','redmine_asciidoc_formatter','lib','redmine_asciidoc_formatter','redmine.conf')
      arg += "--conf-file="+conf
      
      html = AsciiDoc.new(@text).to_html(arg)
      html.gsub!(/%%([\{\}])%%/,'\1\1')
      html.gsub(/wiki:(\w+(\/\w+)*)/, '[[\1]]')
    rescue => e
      return("<pre>problem parsing wiki text: #{e.message}\n"+
             "original text: \n"+
             @text+
             "</pre>")
    end

  end

end
