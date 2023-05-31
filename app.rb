require 'sinatra'
require 'movie'
require 'movie_store' # load MovieStore Class

store = MovieStore.new('movies.yml') #Create a MovieStore instance to update movies.yml

get('/') do
  redirect '/movies'
end

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
  @movie.describe = params['describe']
  store.save(@movie)
  redirect '/movies/new'
end

get('/movies/:id') do
  id = params['id'].to_i # id 為字串，轉成整數
  @movie = store.find(id) # 拿 id 載個別物件
  erb :show
end