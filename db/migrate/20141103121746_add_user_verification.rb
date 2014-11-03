class AddUserVerification < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove :surname
      t.string :verification_code
      t.boolean :verified
    end
  end
end
