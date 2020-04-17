class AddHiddenToProposals < ActiveRecord::Migration[6.0]
  def change
    add_column :proposals, :hidden, :boolean
  end
end
