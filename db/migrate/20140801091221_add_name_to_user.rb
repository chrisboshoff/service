class AddNameToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :name, :surname
    end
  end
end
