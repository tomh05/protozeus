class RemoveTypeFromTemplateParameters < ActiveRecord::Migration
  def change
    remove_column :template_parameters, :type, :string
  end
end
