class RenameInstructionsToNotes < ActiveRecord::Migration[7.1]
  def change
    rename_column :recipes, :instructions, :notes
  end
end
