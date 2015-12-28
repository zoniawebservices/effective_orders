class UpgradeEffectiveOrdersFrom17x < ActiveRecord::Migration
  def self.up
    create_table :custom_products do |t|
      t.text      :description
      t.integer   :price, :default => 0

      t.timestamps
    end

    add_column :orders, :custom, :boolean
  end

  def self.down
    remove_column :orders, :custom
    drop_table :custom_products
  end
end
