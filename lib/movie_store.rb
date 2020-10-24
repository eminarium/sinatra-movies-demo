require 'yaml/store'

class MovieStore

  def initialize(file_name)
    @store = YAML::Store.new(file_name)
  end


end
