class RenameOrganisationEmailToName < ActiveRecord::Migration
  def change
    change_table :organisations do |t|
      t.rename :email, :name
    end
  end
end
