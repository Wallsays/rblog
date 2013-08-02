class Post < ActiveRecord::Base
  attr_accessible :content, :title, :tags_attributes

  # validates :name,  :presence => true
  validates :title, :presence => true,
	        :length => { :minimum => 5 }

  # belongs_to :user
  has_many :comments, :dependent => :destroy
  has_many :tags

  # другая сторона связи с тегами, и сообщение Rails (с помощью макроса
  #	accepts...), что теги будут редактироваться непосредственно в публикациях
  # опция :allow_destroy на объявлении вложенного атрибута говорит Rails отображать чекбокс “removee” in view
  accepts_nested_attributes_for :tags, :allow_destroy => :true,
  :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }

end
