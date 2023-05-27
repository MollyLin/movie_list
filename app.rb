require 'sinatra'
require 'movie'

get('/movies') do
  @movie = Movie.new
  @movie.title = "Beginning Ruby 3: From Beginner to Pro"
  erb :index
end

get('/new') do
  erb :new
end