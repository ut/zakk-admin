Rack::Attack.throttle("logins/ip", limit: 12, period: 1.hour) do |req|
  req.ip if req.post? && req.path.start_with?("/users/sign_in")
end

Rack::Attack.throttle('limit logins per email', limit: 2, period: 60) do |req|
  if req.post? && req.path.start_with?("/users/sign_in")
    req.params['email']
  end
end

ActiveSupport::Notifications.subscribe("rack.attack") do |name, start, finish, request_id, req|
  SECURITY_LOGGER.info "Throttled #{req.env["rack.attack.match_discriminator"]}"
end