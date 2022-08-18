class HomeController < ApplicationController
    def index
        if user_signed_in?
            if current_user.admin==true
             redirect_to librarians_path
            else
        
              redirect_to students_path
            end
        end
    end
end
