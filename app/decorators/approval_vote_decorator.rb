class ApprovalVoteDecorator < Draper::Decorator
  delegate_all

  decorates_association :user

  def vote_class
    case object.vote
    when 'vouch' then 'primary'
    when 'approve' then 'success'
    when 'veto' then 'alert'
    end
  end

  def vote_icon_name
    case object.vote
    when 'vouch' then 'heart'
    when 'approve' then 'like'
    when 'veto' then 'x'
    end
  end

  def vote_icon(opts={})
    h.icon(vote_icon_name, opts)
  end
end
