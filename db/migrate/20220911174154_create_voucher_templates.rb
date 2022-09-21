class CreateVoucherTemplates < ActiveRecord::Migration[7.0]
  def change
    create_table :voucher_templates do |t|
      t.string :title
      t.integer :chance

      t.timestamps
    end
  end
end
