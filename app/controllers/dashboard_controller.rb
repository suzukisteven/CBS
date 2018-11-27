class DashboardController < ApplicationController
  def show
    @company = Company.find(params[:id])
    # byebug
    @employees = @company.users
    @manager = User.find(@company.manager_id)
  end
end
