class NewsletterService
  def subscribe_user(user)
    gb.lists.subscribe({
      id: list_id,
      email: { email: =>  user.email},
      merge_vars: { :FNAME => user.first_name, :LNAME => user.last_name },
      double_optin: false
    })
  end

protected
  def gibbon_api
    @gibbon_api ||= Gibbon::API.new(ENV['MAILCHIMP_KEY'])
  end

  def list_id
    ENV['MAILCHIMP_LIST_ID']
  end
end
