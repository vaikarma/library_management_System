class StudentsController < ApplicationController
 
  def index
    @books=Book.all
  end

  def mydashbord
    @user=current_user
    @book_issues=@user.book_issues
  end
  def searchbook
    @books=Book.where("books.book_name LIKE :search",search: "%#{params[:query]}%")
  end
end
