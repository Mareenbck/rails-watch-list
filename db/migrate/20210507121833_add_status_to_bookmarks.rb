class AddStatusToBookmarks < ActiveRecord::Migration[6.1]
  def change
    add_column :bookmarks, :status, :boolean, default: false
  end
end
