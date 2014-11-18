class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
        t.references :user
        t.string :title, null: false, default: ""
        t.text :text
    end
  end
end
