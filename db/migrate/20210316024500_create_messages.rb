class CreateMessages < ActiveRecord::Migration[6.1]
  def change
    create_table :messages do |t|
      t.text :body, null: false
      t.references :sender, as: :user
      t.references :recipient, as: :user

      t.timestamps
    end
  end
end
