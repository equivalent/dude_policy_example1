class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.integer :author_id
      t.string :secret_note

      t.timestamps
    end
  end
end
