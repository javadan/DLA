class NewsletterService

  def subscribe_user(user)
    gibbon_api.lists.subscribe({
      id: gibbon_list_id,
      email: { email: user.email },
      merge_vars: { :FNAME => user.first_name, :LNAME => user.last_name },
      double_optin: false
    })
    user.update_attribute :newsletter_subscribed, true
  end

protected
  def gibbon_api
    @gibbon_api ||= Gibbon::API.new(ENV['MAILCHIMP_KEY'])
  end

  def gibbon_list_id
    ENV['MAILCHIMP_LIST_ID']
  end
end
