class CreateConfig < ActiveRecord::Migration
  def change
    create_table :configs do |t|
      t.string :units, default: 'metric'
      t.string :language, default: 'pl'
      t.string :country, default: 'PL'

      t.timestamps
    end
  end
end
