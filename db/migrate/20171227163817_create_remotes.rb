class CreateRemotes < ActiveRecord::Migration[5.1]
  def change
    create_table :remotes do |t|
      t.text :text

      t.timestamps
    end
  end
end
