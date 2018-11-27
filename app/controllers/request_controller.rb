class RequestController < ApplicationController
    def create
        @company = Company.find(params[:company_id])
        @request = Request.new
        @request.user_id = current_user.id
        @request.save

        # Creating notification
        notification = Notification.new(recipient_id: @company.manager_id, actor_id:current_user.id, action:'requested to join your', notifiable: @company)
        notification.save
        redirect_to root_url
    end
end
