class AddDesignToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :design, :integer, default: 1
  end
end
