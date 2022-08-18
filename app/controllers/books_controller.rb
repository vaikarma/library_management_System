class BooksController < ApplicationController
  
  load_and_authorize_resource 
  
  before_action :set_book, only: %i[ show edit update ]

  def index
    @books=Book.all
  end

  def new
    @book = Book.new
  end

  def show
  end
  
  def edit
  end
  
  def update
    if @book.update(book_params)
      redirect_to librarians_path
    else
    render :edit
    end
  end  
  def create
    @user=current_user
    @book=@user.books.new(book_params)
    if @book.save!
      redirect_to books_path
    else
      render :new
    end
  end 
  def search
    @books=Book.where("books.book_name LIKE :search",search: "%#{params[:query]}%")
  end
  def searchuser
    @user=User.find_by("users.name LIKE :search",search: "%#{params[:query]}%")
    if @user.nil?
     render 'librarians/index'  
    else
    @books=BookIssue.where(user_id: @user.id)
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:book_name, :title, :author,:price,:stoke,:publish_date,:publication_name,:late_fess) 
  end

  
end
