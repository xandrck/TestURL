class Url < ApplicationRecord
  include Tokens

  has_many :url_logs

  before_create :generate_token
  validates_uniqueness_of :full_path
  validates_presence_of :full_path
  validate :url_full_path

  private

  def url_full_path
    self.errors.add :full_path unless full_path =~ URI::regexp
  end
end
