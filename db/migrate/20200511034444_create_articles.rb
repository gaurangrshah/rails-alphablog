class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title # adds a title field that expects a string value 
    end
  end
end
