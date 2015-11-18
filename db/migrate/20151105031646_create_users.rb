class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :full_name
      t.integer :mobile_number
      t.string :company_name
      t.string :company_address

      t.timestamps null: false
    end
  end
end
