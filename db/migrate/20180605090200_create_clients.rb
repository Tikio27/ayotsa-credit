class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :account_number
      t.integer :age
      t.date :date_of_birth
      t.string :rfc
      t.string :employer
      t.integer :work_seniority

      t.timestamps
    end
  end
end
