RSpec.describe CanRenderMarkdown do
  it "has a version number" do
    expect(CanRenderMarkdown::VERSION).not_to be nil
  end

  it "renders markdown to html" do
    expect(CanRenderMarkdown.formatify('**foo**')).to eq("<p><strong>foo</strong></p>\n")
  end
end
