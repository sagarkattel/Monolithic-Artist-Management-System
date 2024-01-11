class CreateUser < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.date :dob
      t.string :gender
      t.string :address

      t.timestamps
    end
  end
end
