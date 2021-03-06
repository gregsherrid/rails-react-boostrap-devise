class CreateUserOrgLinks < ActiveRecord::Migration
  def change
    create_table :user_org_links do |t|
      t.integer :user_id
      t.integer :org_id
      t.string :role

      t.timestamps
    end

    add_index :user_org_links, :user_id
    add_index :user_org_links, :org_id
  end
end
