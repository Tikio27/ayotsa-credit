class CreateClients < ActiveRecord::Migration[5.1]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :last_name
      t.string :address
      t.string :phone_number
      t.string :account_number
      t.integer :age
      t.date :date_of_birth
      t.string :rfc
      t.string :employer
      t.integer :work_seniority
      t.boolean :payment_note
      t.boolean :ife
      t.boolean :proof_of_address
      t.boolean :curp_doc
      t.boolean :work_certificate
      t.boolean :id_copy
      t.boolean :credit_application_completed

      t.timestamps
    end
  end
end
