class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.references :user, foreign_key: true
      t.references :article, foreign_key: true
      t.text :body
      t.integer :votes, default: 0

      t.timestamps
    end
  end
end
