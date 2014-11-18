class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
        t.references :post
        t.string :title
        t.string :message, null: false, default: ""
    end
  end
end
