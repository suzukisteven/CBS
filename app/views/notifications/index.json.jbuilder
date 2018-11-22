json.array! @notifications do |notification|
    # json.recipient notification.recipient
    json.actor notification.actor.firstname
    json.action notification.action
    json.notifiable do
        json.type "a #{notification.notifiable.class.to_s.underscore.humanize}"
    end
end