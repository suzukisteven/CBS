class CompanyController < ApplicationController
    def new
        @users = User.all
        @users_options = @users.each_with_object([]) do |user, array|
            option = [user.email, user.id]
            array << option
        end
    end
    
    def create
        @users = User.all
        @company = Company.new(company_params)
        @company.save

        selected_ids = params[:company][:user]
        selected_ids.each do |i|
            next if i.blank?
            user = @users.find_by(id:i)
            user.update(company_id: @company.id)
        end
        redirect_to @company
    end

    def show
        @company = Company.find(params[:id])
    end
    
    private
    def company_params
        # Return value is a hash
        params.require(:company).permit(:name, :description)
    end
end
