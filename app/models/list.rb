class List < ApplicationRecord
  has_one_attached :image #titleとbodyに加え,画像を扱うimageカラムが追記されたかのように扱うことができる（active _strange)
  
  validates :title, presence: true #入力されたデータのpresence（存在）をチェックする
  validates :body, presence: true #trueと記述すると、データが存在しなければならないという設定
  validates :image, presence: true
  
end 
