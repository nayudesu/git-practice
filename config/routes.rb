Rails.application.routes.draw do
  get 'top' =>"homes#top" #rootパスを指定
  
  resources :lists #resourcesメソッドは、ルーティングを一括して自動生成してくれる機能

#post 'lists' => 'lists#create'・・・post=新規投稿フォーム作成（create)
#get 'lists/:id' => 'lists#show', as: 'list'・・・as：で名前付きルートを指定しておくことでlink_toなどで使用
#投稿データのidもURLに含める。詳細画面で呼び出される投稿データは、URLの/lists/:id内の:idで判別する。
#edit', as: 'edit_list'・・・URLに:idを用いて記述すると、lists/◯◯/editのすべてのURLが対象になる
#patch 'lists/:id' => 'lists#update', as: 'update_list'・・・更新の場合はPATCHで指定する
 #delete 'lists/:id' => 'lists#destroy', as: 'destroy_list'・・・HTTPメソッドはDELETE、URLはlists/:id,名前付きパスは、destroy_listと設定
end
