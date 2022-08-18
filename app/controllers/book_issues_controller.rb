class BookIssuesController < ApplicationController
    load_and_authorize_resource

    def index
        @book_issues=BookIssue.all
    end

    def new
        @book_issue=BookIssue.new
    end

    def create
        @book_issue=BookIssue.new(book_issue_params)   
      
        if current_user.id == book_issue_params[:user_id].to_i
            render :new
        else
        @book=Book.find(book_issue_params[:book_id])
        if @book_issue.save!
            if @book.stoke>0 
                @book.stoke=@book.stoke-1
                @book.save
            else
             render :new
            end
        redirect_to book_issues_path
        else
        render :new
        end 
    end    
    end
    def destroy
        @bookissue=BookIssue.find(params[:id])
        @user=User.find_by(id:@bookissue.user_id)
        @book=Book.find_by(id:@bookissue.book_id)
        if Time.now.strftime("%Y-%m-%d")>@bookissue.return_date.to_s
            @user.totalfine=@user.totalfine+@book.late_fess
            @user.save
            if @bookissue.destroy
                @book.stoke=@book.stoke+1
                @book.save
             redirect_to librarians_path
            end
        else
            @user.totalfine=@user.totalfine+0
            @user.save
            if @bookissue.destroy
                @book.stoke=@book.stoke+1
                @book.save
                redirect_to librarians_path
            end
        end
    end
    private
  # Use callbacks to share common setup or constraints between actions.
  # Only allow a list of trusted parameters through.
  def book_issue_params
    params.require(:book_issue).permit(:book_id, :user_id, :issue_date,:return_date) 
  end
end
