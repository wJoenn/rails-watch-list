require 'open-uri'

api = 'aad56e1e5ba8a1b3b91c8f6cfee84c63'
data = JSON.parse(URI.open("https://api.themoviedb.org/3/collection/645?api_key=aad56e1e5ba8a1b3b91c8f6cfee84c63&language=en-US").read)
p data
data['parts'].each do |e|
  movie = Movie.create({ title: e['title'],
                         overview: e['overview'],
                         poster_url: "https://www.themoviedb.org/t/p/w300_and_h450_bestv2/#{e['poster_path']}",
                         rating: e['vote_average'] })

  p "#{movie.title} added"
end
