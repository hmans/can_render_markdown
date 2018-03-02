require "kramdown"

require "can_render_markdown/version"
require "can_render_markdown/formatter"
require "can_render_markdown/active_record_plugin"

module CanRenderMarkdown
  def self.formatify(input)
    Formatter.new(input, ERB::Util).escape.to_html
  end
end
