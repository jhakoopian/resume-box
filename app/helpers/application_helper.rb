module ApplicationHelper
  def markdown(content)
  renderer = Redcarpet::Render::HTML.new()
  extensions = {
    hard_wrap: true, filter_html: true
  }

    Redcarpet::Markdown.new(renderer).render(content).html_safe
  end
end
