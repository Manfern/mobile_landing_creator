class AddImagesToAdvantagesAndFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :advantages, :icon, :string
    add_column :feedbacks, :photo, :string
  end
end
