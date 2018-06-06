class CreateCommentsByCredits < ActiveRecord::Migration[5.1]
  def change
    create_table :comments_by_credits do |t|
      t.belongs_to :credit, foreign_key: true
      t.belongs_to :client, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.text :comment

      t.timestamps
    end
  end
end
