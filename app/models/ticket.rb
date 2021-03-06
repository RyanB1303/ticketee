class Ticket < ApplicationRecord
  belongs_to :project
  belongs_to :author, class_name: "User"
  belongs_to :state, optional: true
  validates :name, presence: true
  validates :description, presence: true, length: {minimum:10}

  has_many_attached :attachments
  
  has_many :comments, dependent: :destroy
  
  has_and_belongs_to_many :watchers,
    join_table: "ticket_watchers",
    class_name: "User"
  
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :tags

  before_create :assign_default_state

  searcher do
    label :tag, from: :tags, field: "name"
    label :state, from: :state, field: "name"
  end

  private
  
  def assign_default_state
    self.state ||= State.default
  end

end
