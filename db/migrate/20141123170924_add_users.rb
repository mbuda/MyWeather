class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick
      t.string :password_digest

      t.timestamps
    end

    add_column :app_configs, :user_id, :string
  end
end
