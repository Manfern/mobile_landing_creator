class AddSelectedPageToAdmin < ActiveRecord::Migration[5.0]
  def change
    add_column :admins, :selected_page, :integer, default: 1
  end
end
