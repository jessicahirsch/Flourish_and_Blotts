class CreateRelations < ActiveRecord::Migration[5.0]
  def change
    create_table :relations do |t|
      t.string :og
      t.string :requester
      t.string :book_id
      t.string :book_places

      t.timestamps
    end
  end
end
