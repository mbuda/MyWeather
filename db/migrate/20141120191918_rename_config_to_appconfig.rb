class RenameConfigToAppconfig < ActiveRecord::Migration
  def change
    rename_table :configs, :app_configs
  end
end
