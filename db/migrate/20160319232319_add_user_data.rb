class AddUserData < ActiveRecord::Migration
  def change
    add_column :users,:preference,:string
    add_column :users,:inclusion,:string
    add_column :users,:ticket,:string
  end
end
