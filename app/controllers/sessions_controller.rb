class SessionsController < ApplicationController
  def create
    render text: "<pre>#{env["omniauth.auth"]}</pre>"
    #<OmniAuth::AuthHash credentials=#<OmniAuth::AuthHash expires=true expires_at=1387854000 token="CAAICWubbWsQBABu2DChorZCzV3ValDyCZAqtp1b5G6AMgkrJMG29zreTnhUnTsf1yUlIgiSkL08d8qMJXtqnRas63kuSm5G8ZB0gyGEV5i3rrlYJFHcrJ6StVm5ZB1kQRwTxri6ZBiul9WgvHv52L8melxQEWQtcjGv3f7pZAVMVHCvfsx6ZATvZBHGcpBIAEIuyGAqdvCp8VgZDZD"> extra=#<OmniAuth::AuthHash raw_info=#<OmniAuth::AuthHash first_name="Dan" gender="male" id="100007074455662" last_name="Davey" link="https://www.facebook.com/dan.davey.146" locale="en_US" name="Dan Davey" timezone=2 updated_time="2013-12-20T13:40:31+0000" username="dan.davey.146" verified=true>> info=#<OmniAuth::AuthHash::InfoHash first_name="Dan" image="http://graph.facebook.com/100007074455662/picture?type=square" last_name="Davey" name="Dan Davey" nickname="dan.davey.146" urls=#<OmniAuth::AuthHash Facebook="https://www.facebook.com/dan.davey.146"> verified=true> provider="facebook" uid="100007074455662">
    # Date.strptime(epoch.to_s, '%s')
  end
end

