class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.string :email
      t.string :tenant_name

      t.timestamps
    end
  end
end
