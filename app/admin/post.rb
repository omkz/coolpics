ActiveAdmin.register Post do
 index do
    column :title
    column :image
    column "Created Date", :created_at
    
  end
end
