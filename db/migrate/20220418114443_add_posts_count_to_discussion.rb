class AddPostsCountToDiscussion < ActiveRecord::Migration[7.0]
  def change
    add_column :discussions, :post_count, :integer, default: 0
  end
end
