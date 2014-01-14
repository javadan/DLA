class UserDecorator < Draper::Decorator
  delegate_all

  def fb_image_card
    h.content_tag :div, class: 'th' do
      fb_image(type: :square, width: 150, height: 150) + 
      h.content_tag(:label, object.name, style: 'margin: 15px 5px')
    end
  end

  def fb_image(opts={})
    opts.reverse_merge!(type: :square)
    h.image_tag fb_image_url(opts), alt: object.name
  end

  def fb_image_url(opts={})
    "http://graph.facebook.com/#{object.fb_uid}/picture?#{opts.to_query}"
  end
end
