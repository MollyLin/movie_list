require 'sinatra'
require 'movie'
require 'movie_store' # load MovieStore Class

store = MovieStore.new('movies.yml') #Create a MovieStore instance to update movies.yml

get('/movies') do
  @movies = store.all # load all movies object
  erb :index
end

get('/movies/new') do
  erb :new
end

post('/movies/create') do
  @movie = Movie.new
  @movie.title = params['title']
  @movie.director = params['director']
  @movie.year = params['year']
  store.save(@movie)
  redirect '/movies/new'
end