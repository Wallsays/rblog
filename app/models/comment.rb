class Comment < ActiveRecord::Base
  attr_accessible :body, :commenter
  
  # belongs_to :user
  belongs_to :post

end
