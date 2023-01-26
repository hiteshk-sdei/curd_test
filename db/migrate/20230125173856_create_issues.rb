class CreateIssues < ActiveRecord::Migration[5.2]
  def change
    create_table :issues do |t|
      t.string :title
      t.string :description
      t.string :assigned_to
      t.integer :status, default: 0
      t.integer :project_id
      t.integer :user_id
      t.timestamps
    end
  end
end
