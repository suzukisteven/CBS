json.array! @notifications do |notification|
    # json.recipient notification.recipient
    json.notification_id notification.id
    json.actor notification.actor
    json.recipient notification.recipient
    json.action notification.action
    json.notifiable do
        json.type "#{notification.notifiable.class.to_s.underscore.humanize.downcase}"
    end
end