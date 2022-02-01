class BooksController < ApplicationController
  def index
    #登録してあるブックを表示
    @books = Book.order(id: :ASC) #インスタンス変数に登録したブックのリストを格納(idで昇順にソート)*昇順:ASC, 降順:DESC
    # @books = Book.all #ソートするためallメソッドは使用しない

    #New bookのフォーム
    @book = Book.new #Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成
  end

  def create
    @book = Book.new(book_params) #データを受け取り新規作成するためのインスタンス作成
    if @book.save
      redirect_to book_path(@book.id), notice: "Book was successfully created." #トップ画面へリダイレクト
    else
      @books = Book.all #renderを使用する前にindexのインスタンス変数を定義
      render :index
    end

    # book.save #データをデータベースに保存するためのsaveメソッド実行
    # redirect_to book_path(book.id) #トップ画面へリダイレクト
  end

  def show
     @book = Book.find(params[:id]) #Viewへ渡すためのインスタンス変数に特定のレコードを1件取得
  end

  def edit
     @book = Book.find(params[:id]) #Viewへ渡すためのインスタンス変数に特定のレコードを1件取得
  end

  def destroy
    book = Book.find(params[:id]) #特定のレコードを1件取得
    book.destroy #レコードを削除
    redirect_to index_path, notice: "Book was successfully destroyed."
  end

  def update
    @book = Book.find(params[:id]) #特定のレコードを1件取得
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: "Book was successfully updated." #show画面へリダイレクト
    else
      render :edit
    end

    # book.update(book_params) #データをデータベースに更新するためのupdateメソッドを実行
    # redirect_to book_path(book.id) #show画面へリダイレクト
  end

  private
  #ストロングパラメータ
  def book_params

    params.require(:book).permit(:title, :body)

  end

end
