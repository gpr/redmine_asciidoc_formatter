# Redmine Asciidoc formatter
require 'redmine'

RAILS_DEFAULT_LOGGER.info 'Starting Asciidoc formatter for Redmine'

Redmine::Plugin.register :redmine_asciidoc_formatter do
  name 'Asciidoc formatter'
  author 'Gregory Romé'
  author_url 'http://github.com/gpr/redmine_asciidoc_formatter'
  description 'Asciidoc wiki formatting for Redmine'
  version 'HEAD (master)'

  requires_redmine :version_or_higher => '1.0'

  wiki_format_provider 'asciidoc', RedmineAsciidocFormatter::WikiFormatter, RedmineAsciidocFormatter::Helper
end
