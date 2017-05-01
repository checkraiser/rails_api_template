# initializers/notifications.rb
ActiveSupport::Notifications.subscribe('rack.attack') do |_, _, _, _, req|
  if req.env['rack.attack.match_type'] == :throttle
    Rails.logger.info "Throttled IP: #{req.ip}"
  end
end
