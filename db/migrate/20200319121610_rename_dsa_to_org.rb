class RenameDsaToOrg < ActiveRecord::Migration[6.0]
  def change
    rename_column :portals, :to_dsa, :to_org
    rename_column :users, :dsa_member, :org_member
  end
end
