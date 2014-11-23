class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.integer :value
      t.string :user_id
      t.string :post_id
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end
  end
end
