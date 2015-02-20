class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.boolean :vote
      t.integer :bill_id

      t.timestamps null: false
    end
  end
end
