# Redmine Asciidoc formatter
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Asciidoc formatter for Redmine'

Redmine::Plugin.register :redmine_asciidoc_formatter do
  name 'Asciidoc formatter'
  author 'Gregory Romé'
  description 'Asciidoc formatting for Redmine'
  version '0.1.0'

  wiki_format_provider 'asciidoc', RedmineAsciidocFormatter::WikiFormatter, RedmineAsciidocFormatter::Helper
end
