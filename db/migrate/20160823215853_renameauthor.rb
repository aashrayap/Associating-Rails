class Renameauthor < ActiveRecord::Migration
  def change
    change_table :comments do |t|
      t.rename :author_id, :user_id
    end
  end
end
