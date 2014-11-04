class RemoveOrgUserId < ActiveRecord::Migration
  def change
     change_table :organisations do |t|
      t.remove :user_id
    end
  end
end
