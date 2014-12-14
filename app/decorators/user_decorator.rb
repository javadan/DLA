class UserDecorator < Draper::Decorator
  delegate_all

  decorates_associations :candidate_approval_votes, with: ApprovalVoteDecorator

  def fb_image_card(content = '')
    h.content_tag :div, class: 'th' do
      fb_image(type: :square, width: 150, height: 150) + 
      h.content_tag(:label, style: 'margin: 15px 5px') do 
        "#{object.name} <br/> <strong>#{content}</strong>".html_safe
      end
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
