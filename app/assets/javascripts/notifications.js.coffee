# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
class Notifications
    constructor: ->
        @notifications = $("[data-behavior='notifications']")
        @setup() if @notifications.length > 0
    
    setup: ->
        $("[data-behavior='notifications-link']").on "click", @handleClick
        $.ajax(
            url: "/notifications.json"
            dataType: "JSON"
            method: "GET"
            success: @handleSuccess
        )

    handleClick: (e) =>
        $.ajax(
            url: "/notifications/mark_as_read"
            dataType: "JSON"
            method: "POST"
            success: ->
                $("[data-behavior='unread-count']").text(0)
        )    

    handleSuccess: (data) =>
        console.log(data)
        items= $.map data, (notification) ->
            url = "/companies/#{notification.recipient.company_id}/users/#{notification.actor.id}/confirm"
            "<div class='dropdown-item'>
                #{notification.actor.firstname} #{notification.action} #{notification.notifiable.type}
            </div>
            <a href='#{url}'> accept </a>"
        $("[data-behavior='unread-count']").text(items.length)
        $("[data-behavior='notification-items']").html(items)
jQuery ->
    new Notifications


