class Event < ApplicationRecord
  validates_presence_of :name, :description
  has_many :attendees, ->{ where(["created_at > ?", Time.now - 7.day]).order("id DESC") }, :dependent =>:destroy
  belongs_to :category, :optional => true
  has_one :location, :dependent =>:destroy
  has_many :event_groupships
  has_many :groups, :through => :evevt_groupships
  belongs_to :category
  # 不明以下操作放哪里
  # delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
