require 'yaml/store'

class MovieStore

  def initialize(file_name)
    @store = YAML::Store.new(file_name)
  end

  def find(id)
    @store.transaction do
      @store[id]
    end
  end

  def all
    @store.transaction do
      @store.roots.map { |id| @store[id] }
    end
  end

end
