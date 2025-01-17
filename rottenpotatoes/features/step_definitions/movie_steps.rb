# Add a declarative step here for populating the DB with movies.

Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    # each returned element will be a hash whose key is the table header.
    # you should arrange to add that movie to the database here.
    Movie.create(movie)
  end
end

Then /(.*) seed movies should exist/ do | n_seeds |
  expect(Movie.count).to eq n_seeds.to_i
end

# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |e1, e2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  expect(page.body.index(e1) < page.body.index(e2))

end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings:(.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  
  ratings = rating_list.split(', ')
  
  if uncheck 
    
    ratings.each do |rating|
      uncheck("ratings_" + rating)
    end
    
  else
    
    ratings.each do |rating|
      check("ratings_" + rating)
    end
    
  end
  
end

Then /I should (not )?see all movies with ratings:(.*)/ do |option, rating_list|
  # Make sure that all the movies in the app are visible in the table

  ratings = rating_list.split(', ')
  movie_array = []
  
  ratings.each do |rating|
    movie_array +=  Movie.select{|movie| movie.rating == rating}
  end
  
  if option
    
    movie_array.each do |movie|
      expect(page).to have_no_content(movie.title)
    end
    
  else
    
    movie_array.each do |movie|
      expect(page).to have_content(movie.title)
    end
    
  end
  
end


