class AddReviewsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.column :city, :string
      t.column :comment, :string

      t.timestamps
    end
  end
end
