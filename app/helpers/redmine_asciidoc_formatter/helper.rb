module RedmineAsciidocFormatter
  module Helper
    unloadable

    def wikitoolbar_for(field_id)
      
      url = Redmine::Utils.relative_url_root + 
            Engines::RailsExtensions::AssetHelpers.plugin_asset_path('redmine_asciidoc_formatter', 'help', 'asciidoc_syntax.html')

      help_link = l(:setting_text_formatting) + ': ' +
                  link_to(l(:label_help), url,
                  :onclick => "window.open(\"#{url}\", \"\", \"resizable=yes, location=no, menubar=no, status=no, scrollbars=yes\"); return false;")

      javascript_include_tag('jstoolbar/jstoolbar') +
        javascript_include_tag('asciidoc', :plugin => 'redmine_asciidoc_formatter') +
        javascript_include_tag("jstoolbar/lang/jstoolbar-#{current_language}") +
        javascript_tag("var toolbar = new jsToolBar($('#{field_id}')); toolbar.setHelpLink('#{help_link}'); toolbar.draw();")
    end

    def initial_page_content(page)
      "#{page.pretty_title}\n#{'='*page.pretty_title.length}"
    end

    def heads_for_wiki_formatter
      stylesheet_link_tag('jstoolbar') +
        stylesheet_link_tag('asciidoc-xhtml11', :plugin => 'redmine_asciidoc_formatter') + 
        javascript_include_tag('toc-footnote', :plugin => 'redmine_asciidoc_formatter') + 
        javascript_include_tag('asciidoc-xhtml11', :plugin => 'redmine_asciidoc_formatter')
    end
  end
end
