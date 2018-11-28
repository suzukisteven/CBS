class AudioController < ApplicationController

  def index
    @company = Company.find(params[:company_id])
    @employees = @company.users
  end

end
