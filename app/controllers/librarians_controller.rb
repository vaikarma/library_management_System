class LibrariansController < ApplicationController
  load_and_authorize_resource :class =>"Book"
  before_action :set_book, only: %i[ show ]

  def index
    
  end

  def show
  end
  
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end
end
