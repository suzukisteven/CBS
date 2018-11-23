class UsersController < Clearance::UsersController
    def show
        @user = User.find(params[:id])
    end
    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to @user
    end
    # def edit
    #     @user = User.find(params[:id])
    # end


    def subscribe_to_plan
    end
    
    private 

    # Override user_from_params from default clearance controller
    def user_from_params
        email = user_params.delete(:email)
        password = user_params.delete(:password)
        firstname = user_params.delete(:firstname)
        lastname = user_params.delete(:lastname)
        position = user_params.delete(:position)
    
        Clearance.configuration.user_model.new(user_params).tap do |user|
          user.email = email
          user.password = password
          user.firstname = firstname
          user.lastname = lastname
          user.position = position
        end
    end
    
    def user_params
        params.require(:user).permit(:email, :password, :firstname, :lastname, :position, :image)
    end
end
