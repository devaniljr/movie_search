class CreateSearches < ActiveRecord::Migration[7.0]
  def change
    create_table :searches do |t|
      t.string :title
      t.references :movie, null: true, foreign_key: true

      t.timestamps
    end
  end
end
