class CompanyController < ApplicationController
    def new
        @users = User.where(company_id:nil)
        @users_options = @users.each_with_object([]) do |user, array|
            option = [user.email, user.id]
            array << option
        end
    end

    def employees_index
        @company = Company.find(params[:id])
        @employees= @company.users
    end

    def remove_employee
        @user = User.find(params[:id])
        @company_id = @user.company.id
        @user.update(company_id: nil)
        redirect_to employees_index_path(@company_id)
    end
    
    def create
        @users = User.all
        @company = Company.new(company_params)
        @company.save
        @company.update(manager_id:current_user.id)
        current_user.update(company_id:@company.id)

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
        @employees = @company.users
        @manager = User.find(@company.manager_id)
    end

    def update
        @company = Company.find(params[:id])
    end
    
    private
    def company_params
        # Return value is a hash
        params.require(:company).permit(:name, :description, :image, :manager)
    end
end
