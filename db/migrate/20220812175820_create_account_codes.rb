class CreateAccountCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :account_codes do |t|
      t.integer :code
      t.boolean :used
      t.datetime :usage_date
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
