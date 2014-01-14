module NavHelper
  def nav_item(content, target)
    active = target.to_s.include?(controller.controller_name) || target.to_s.include?(controller.controller_name.singularize) 
    content_tag :li, class: ('active' if active) do
      link_to(content, target)
    end
  end
end