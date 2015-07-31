class AddParamTypeToTemplateParameters < ActiveRecord::Migration
  def change
    add_column :template_parameters, :param_type, :string
  end
end
