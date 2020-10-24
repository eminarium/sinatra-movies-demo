require 'yaml/store'

class MovieStore

  # Initializes movie storage file with the given filename
  def initialize(file_name)
    @store = YAML::Store.new(file_name)
  end

  # Returns the required movie with the given id
  def find(id)
    @store.transaction do
      @store[id]
    end
  end

  # Returns list of all movies from the movie storage file
  def all
    @store.transaction do
      @store.roots.map { |id| @store[id] }
    end
  end

  # Stores the parameter movie into the file
  def save(movie)
    @store.transaction do
      unless movie.id
        # Get the highest existing id
        # or assign 0 if it is the first movie
        highest_id = @store.roots.max || 0
        movie.id = highest_id
      end

      # Store the movie in the file with the assigned id
      @store[movie.id] = movie
    end
  end

end
