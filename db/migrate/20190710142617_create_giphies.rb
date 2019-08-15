class CreateGiphies < ActiveRecord::Migration[5.2]
  def change
    create_table :giphies do |t|
      t.string :image
      t.string :title
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
