ActiveAdmin.register Doctor do
  permit_params :id, :name

  index do
    selectable_column
    column(:name)
    column(:category)
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :category
    end
    f.actions
  end
end
