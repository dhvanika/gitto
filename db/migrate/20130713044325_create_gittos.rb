class CreateGittos < ActiveRecord::Migration
  def change
    create_table :gittos do |t|

      t.timestamps
    end
  end
end
