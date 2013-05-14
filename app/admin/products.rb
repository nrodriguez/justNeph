ActiveAdmin.register Product do
   index do
    column :id
    column :name
    column :category
    column :active
    column :price
    column :image do |product|
      image_tag(product.image, height: 150, width: 150)
    end
    actions
  end

  show do |ad|
    attributes_table do
      row :name
      row :description
      row :category
      row :price
      row :active
      row :url do
        link_to ad.url, :target => "_blank"
      end
      row :image do
        image_tag(ad.image, height: 300, width: 300)
      end
    end
  end
end
