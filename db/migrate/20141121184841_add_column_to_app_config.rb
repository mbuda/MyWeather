class AddColumnToAppConfig < ActiveRecord::Migration
  def change
    add_column :app_configs, :name, :string
  end
end
