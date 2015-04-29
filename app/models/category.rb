class Category < ActiveRecord::Base
  has_many :tickets
  acts_as_tree order: :name

  validates :name, presence: true

  scope :mains, -> { where(parent: nil) }
  scope :subs, -> { where.not(parent: nil) }

  # class Category < ActiveRecord::Base
  #   acts_as_tree :order => "name"
  # end

  # Example:
  # root
  #  \_ child1
  #       \_ subchild1
  #       \_ subchild2

  # root      = Category.create("name" => "root")
  # child1    = root.children.create("name" => "child1")
  # subchild1 = child1.children.create("name" => "subchild1")

  # root.parent   # => nil
  # child1.parent # => root
  # root.children # => [child1]
  # root.children.first.children.first # => subchild1
end
