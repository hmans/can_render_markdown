module CanRenderMarkdown
  class Formatter
    def initialize(input, view)
      @input = input
      @view = view
    end

    def escape
      @input = @view.send(:html_escape, @input)
      self
    end

    def to_html
      output = kramdown_document.to_html
      output.respond_to?(:html_safe) ? output.html_safe : output
    end

    private

    def kramdown_document
      Kramdown::Document.new(@input)
    end
  end
end
