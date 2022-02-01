class Book < ApplicationRecord

  #バリデーションの設定をするために下記2行を追加
  validates :title, presence: true
  validates :body, presence: true

end
