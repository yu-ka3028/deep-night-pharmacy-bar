module ApplicationHelper
  def inline_svg(filename, css_class: nil)
    path = Rails.root.join("app/assets/images", filename)
    svg = File.read(path)
    svg = svg.sub("<svg ", "<svg class=\"#{css_class}\" ") if css_class
    svg.html_safe
  end
end
