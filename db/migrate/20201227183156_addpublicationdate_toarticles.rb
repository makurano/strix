class AddpublicationdateToarticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :publication_date, :date
  end
end
