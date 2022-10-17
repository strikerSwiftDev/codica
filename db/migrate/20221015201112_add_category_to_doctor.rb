class AddCategoryToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :category
  end
end
