ActiveAdmin.register Comment, :as => "PostComment" do
  includes :user, :post
  menu parent: "Posts"
end
