class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :author, limit: 20
      t.text :text
      t.references :reviewable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
