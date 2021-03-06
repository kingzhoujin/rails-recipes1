class Event < ApplicationRecord

 validates_presence_of :name, :friendly_id
 validates_uniqueness_of :friendly_id
 validates_format_of :friendly_id, :with => /\A[a-z0-9\-]+\z/

    def to_param
      self.friendly_id
    end

    belongs_to :category, :optional => true

  protected

  def generate_friendly_id
    self.friendly_id ||= SecureRandom.uuid
  end

  STATUS = ["draft", "public","private"]
  validates_inclusion_of :status, :in => STATUS
end
