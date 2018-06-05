class CreateDocuments < ActiveRecord::Migration[5.1]
  def change
    create_table :documents do |t|
      t.belongs_to :client, foreign_key: true
      t.belongs_to :credit, foreign_key: true
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
