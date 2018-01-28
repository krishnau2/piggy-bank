class Account < ApplicationRecord
  has_many :bank_transactions
  before_create :set_slug

  def amount
    return nil
  end

  private
    def set_slug
      self.slug = self.name.parameterize.underscore
    end
end
