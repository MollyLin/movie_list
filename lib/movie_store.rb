require 'yaml/store'

class MovieStore
  def initialize(file_name)
    @store = YAML::Store.new(file_name) # YAML::Store => Public Class Methods
  end

  def all
    @store.transaction do
      @store.roots.map { |id| @store[id] } # 以每個 key 來建立陣列
    end
  end
  
  def save(movie)
    @store.transaction do
      unless movie.id
        highest_id = @store.roots.max || 0
        movie.id = highest_id + 1
      end
      @store[movie.id] = movie
    end
  end
end