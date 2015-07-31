class RemoveValueFromTemplateParameters < ActiveRecord::Migration
  def down
    remove_column :template_parameters, :value
    remove_column :template_parameters, :atom
  end
end
