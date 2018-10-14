class ChangeAuthorIdToBeNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :books, :author_id, true
  end
end
