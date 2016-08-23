class AddPostidToComments < ActiveRecord::Migration
  def change
    add_column :comments, :post_id, :integer
    add_column :comments, :author_id,:string
  end
end
