module UsersHelper

    def user_params
        # take the params, require object that comes through our params and then permit any other params we want
        params.require(:user).permit(:username, :password)
    end 
    
end
