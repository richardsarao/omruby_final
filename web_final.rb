require 'sinatra'
require 'spotlite'
#this file starts up a local server

get '/' do
  	erb :index_final
end

post '/' do
	moviename = usr_movie(params[:from_form])
	@title = moviename[0] #title
	@movie_url = moviename[1] #movie url
	@director = moviename[2] #director
	@cast1 = moviename[3] #cast 1
	@cast1url = moviename[4] #cast 1 url
	@cast2 = moviename[5] #cast2
	@cast2url = moviename[6] #cast2 url
	@year = moviename[7] #year	
	@runtime = moviename[8] #runtime
	@genres = moviename[9].join(", ")
	@title1 = moviename[10]
	@title2 = moviename[11]
	@url1 = moviename[12]
	@url2 = moviename[13]
  	erb :index_final
end

def usr_movie(movie)
	list = Spotlite::Movie.find(movie)
	movie = list.first

	movie_array = [title = movie.title, #0
	movie_url = movie.url, #1
	director = movie.directors[0].name, #2
	cast1 = movie.cast[0].name,#3
	cast1_url = movie.cast[0].url,#4
	cast2 = movie.cast[1].name,#5
	cast2_url = movie.cast[1].url,#6
	year = movie.year,#7
	runtime = Time.at(movie.runtime * 60).utc.strftime("%H:%M"),#8
	genres = movie.genres, #9
	title1 = list[1].title, #10
	title2 = list[2].title, #11
	url1 = list[1].url, #12
	url2 = list[2].url, #13
	listsize = list.size]
	
	return movie_array
end

