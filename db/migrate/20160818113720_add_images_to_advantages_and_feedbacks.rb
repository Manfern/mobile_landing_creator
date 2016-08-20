class AddImagesToAdvantagesAndFeedbacks < ActiveRecord::Migration[5.0]
  def change
    add_column :advantages, :image, :string
    add_column :feedbacks, :image, :string
  end
end
