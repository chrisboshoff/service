class AddRefsBetweenOrgsAndUsers < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.belongs_to :organisation
    end
    
    change_table :organisations do |t|
      t.belongs_to :user
    end
  end
end
