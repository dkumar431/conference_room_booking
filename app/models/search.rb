class Search
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :date, :start_time, :end_time

  def persisted?
    false
  end
  
end