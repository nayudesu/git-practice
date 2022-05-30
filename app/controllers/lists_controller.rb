class ListsController < ApplicationController
  def new
    @list = List.new #form_withヘルパーでList.newはcreateに送信する
  end
  
  def create
    list = List.new(list_params) 
    # フォームに記述した文字やデータを受け取る＋受け取ったデータを元にインスタンスを作成する
    list.save
    #呼び出したModelインスタンスをデータベースに保存する
    redirect_to list_path(list.id) #showアクションにリダイレクトするため名前付きルートを使用
    #引数を付けずにlist_pathのみを書いた場合、showアクションはどの投稿を見ればよいのかわからず、エラーになる
  end 

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id]) #params=URL毎に取得するレコードを変えることが可能
    #findメソッドは引数を受け取り、idカラムを引数と比べてレコードを取得してくるメソッド
  end

  def edit
    @list = List.find(params[:id]) #投稿済みのデータを編集するため、保存されているデータが必要＝findメソッド
  end
  
  def update #更新機能のためのアクション #viewに表示させる必要がないためローカル変数
    list = List.find(params[:id]) #投稿済みのデータを編集するため、保存されているデータが必要＝findメソッド
    list.update(list_params) #ストロングパラメータ
    redirect_to list_path(list.id) #showアクションにリダイレクトするため名前付きルートを使用
  end 
  
  private #コントローラのみで実装
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
    #paramsはformから送られてくるデータはparamsの中に入っている
    #requireは送られてきたデータの中からモデル名(ここでは:list)を指定し、データを絞り出す
    #permitは保存するカラムを指定する
  end
end
