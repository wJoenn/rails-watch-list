require 'open-uri'

data = JSON.parse(URI.open('https://api.themoviedb.org/3/movie/top_rated?api_key=aad56e1e5ba8a1b3b91c8f6cfee84c63&language=en-US&page=1').read)
data['results'].first(10).each do |e|
  Movie.create({ title: e['title'],
                 overview: e['overview'],
                 poster_url: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/#{e['poster_path']}",
                 rating: e['vote_average'] })
end
