class BooksController < ApplicationController


  def create
    @user = current_user
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
  end

  def index
    @book=Book.new
    @books=Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def destroy
    @books = Book.find(params[:id])
    flash[:notice] = "Book was successfully destroyed."
    @books.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :category)
  end
end
