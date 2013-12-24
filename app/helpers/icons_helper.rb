module IconsHelper
  def icon(identifier, opts={})
    content_tag(:i, "#{'&nbsp;' if opts.delete(:spacer)}".html_safe, class: "fi-#{identifier}")
  end
end