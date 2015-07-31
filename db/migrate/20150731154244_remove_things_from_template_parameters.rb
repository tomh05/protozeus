class RemoveThingsFromTemplateParameters < ActiveRecord::Migration
  def change
    remove_column :template_parameters, :atom_id, :references
    remove_column :template_parameters, :value, :string
  end
end
