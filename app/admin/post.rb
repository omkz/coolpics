ActiveAdmin.register Post do
 
#  scope :all, default: true
 filter :title
 

 index do
    column :title
    column :image
    column "Created Date", :created_at
    actions
    
  end
end
