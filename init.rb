# encoding: utf-8
# Redmine Asciidoc formatter
require 'redmine'
require 'redmine_asciidoc_formatter'

Redmine::Plugin.register :redmine_asciidoc_formatter do
  name 'Asciidoc formatter'
  author 'Gregory Romé'
  description 'Asciidoc wiki formatting for Redmine'
  version '0.3.0'
  author_url 'http://github.com/gpr/redmine_asciidoc_formatter'

  wiki_format_provider 'asciidoc', RedmineAsciidocFormatter::WikiFormatting::Formatter,
                       RedmineAsciidocFormatter::WikiFormatting::Helper

end
