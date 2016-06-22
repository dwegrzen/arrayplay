require 'erb'


movies = []
movies << {
  title: "Forest Gump",
  budget: 55,
  stars: ["Tom Hanks"]
}
movies << {
  title: "Star Wars",
  budget: 11,
  stars: ["Mark Hamill", "Harrison Ford"]
}
movies << {
  title: "Batman Begins",
  budget: 150,
  stars: ["Christian Bale", "Liam Neeson", "Michael Caine"]
}
movies << {
  title: "Titanic",
  budget: 200,
  stars: ["Kate Winslet", "Leonardo DiCaprio"]
}
movies << {
  title: "Inception",
  budget: 160,
  stars: ["Leonardo DiCaprio", "JGL"]
}

our_class = %w(isiah marie sean daniel)
shortnames = our_class.select{|i| i.length<5}

sentence = "Ruby is actually kind of fun once you get used to it."
sentence_array = sentence.split(" ")
shortwords = sentence_array.select{|i| i.length==4}

lowbudget=[]
movies.each do |h|
  if h[:budget]<100
    lowbudget<<h[:title]
  end
end

leonardo=[]
movies.each do |h|
  if h[:stars].include?"Leonardo DiCaprio"
    leonardo<<h[:title]
  end
end

def four_words(text)
  text = text.split(" ")
  text.select{|i| i.length==4}
end

def how_many_words(text,num)
  text = text.split(" ")
  text.select{|i| i.length==num}
end

moviebudget = movies.inject(0){|sum, cost| sum += cost[:budget]}

moviestars=[]
movies.each do |k|
  moviestars << k[:stars]
end

moviestars = moviestars.flatten
moviestars = moviestars.uniq

starsarray = moviestars.map{|n| [title:n]|[movie:movies.collect{|k| k[:title] if k[:stars].include?n}.compact]}

def starring(name,array)
  array.collect{|x| x[:title] if x[:stars].include?name}.compact
end


moviebudget = movies.inject(0){|sum, cost| sum += cost[:budget]}
avgmoviebudget = moviebudget/movies.size



budget = movies.map {|x| x[:budget]}.sort!
medianmoviebudget = budget[budget.length/2]

new_file = File.open("./arrayplay.html", "w+")
new_file << ERB.new(File.read("index.html.erb")).result(binding)
new_file.close
