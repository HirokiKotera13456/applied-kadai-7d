class BooksController < ApplicationController


  def create
    @books = Book.all
    @book=Book.new(book_params)
    @book.user_id= current_user.id
   if @book.save
     redirect_to book_path(@book.id),notice: "You have created book successfully."
   else
       @user = current_user
       render :index
   end
  end

  def index
    @book=Book.new
    @books=Book.all
    @book.user_id = current_user.id
    @user = current_user
  end
  
  def edit
    @book = Book.find(params[:id])
    if @book.user_id != current_user.id
      redirect_to books_path
    end
  end
  
  def update
    @book=Book.find(params[:id])
   if @book.update(book_params)
    redirect_to book_path(@book.id), notice: "You have updated book successfully."
   else
    render :edit
   end
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :category)
  end
end