class AddDesignToPage < ActiveRecord::Migration[5.0]
  def change
    add_column :pages, :design, :integer
  end
end
