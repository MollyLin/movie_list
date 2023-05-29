require 'yaml/store'

class MovieStore
  def initialize(file_name)
    @store = YAML:Store.new(file_name)
  end

  def sava(movie)
    @store.transaction do
      unless movie.id
        highest_id = @store.roots.max || 0
        movie.id = highest_id + 1
      end
      @store[movie.id] = movie
    end
  end
end