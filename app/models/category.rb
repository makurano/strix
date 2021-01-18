class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '論文 / paper' },
    { id: 2, name: '研究ノート / note' },
    { id: 3, name: '資料 / document' },
    { id: 4, name: 'その他 / other' }
  ]

  include ActiveHash::Associations
  has_many :articles
end
