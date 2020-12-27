class Category < ActiveHash::Base
  self.data = [
    { id: 0, name: '---'},
    { id: 1, name: 'paper'},
    { id: 2, name: 'note'},
    { id: 3, name: 'document'},
    { id: 4, name: 'other'}
  ]

  include ActiveHash::Associations
  has_many :articles
end
