class CreateSongs < ActiveRecord::Migration[7.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :author
      t.datetime :date
      t.integer :duration

      t.timestamps
    end
  end
end
