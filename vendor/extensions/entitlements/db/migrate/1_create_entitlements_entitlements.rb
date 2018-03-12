class CreateEntitlementsEntitlements < ActiveRecord::Migration[5.1]

  def up
    create_table :refinery_entitlements do |t|
      t.string :rank
      t.float :total_weight_self
      t.float :total_weight_self_plus_dependents
      t.int :pro_gear_weight
      t.int :pro_gear_weight_spouse
      t.string :slug
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-entitlements"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/entitlements/entitlements"})
    end

    drop_table :refinery_entitlements

  end

end
