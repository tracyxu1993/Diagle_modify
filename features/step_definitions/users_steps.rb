# Add a declarative step here for populating the DB with movies.

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create!(user)
  end
end
 
# Make sure that one string (regexp) occurs before or after another one
#   on the same page

Then /I should see "(.*)" before "(.*)"/ do |movie_title1, movie_title2|
  #  ensure that that e1 occurs before e2.
  #  page.body is the entire content of the page as a string.
  body =page.body
  location_of_movie_title1_in_body = body.index(movie_title1)
  location_of_movie_title2_in_body = body.index(movie_title2)
  loc1 = location_of_movie_title1_in_body
  loc2 = location_of_movie_title2_in_body
  if loc1 == nil || lic2 == nil
    fail "One of both search parameters not found"
  else
    expect(loc1<loc2).to eq true
  end
end

# Make it easier to express checking or unchecking several boxes at once
#  "When I uncheck the following ratings: PG, G, R"
#  "When I check the following ratings: G"

When /I (un)?check the following ratings: (.*)/ do |uncheck, rating_list|
  # HINT: use String#split to split up the rating_list, then
  #   iterate over the ratings and reuse the "When I check..." or
  #   "When I uncheck..." steps in lines 89-95 of web_steps.rb
  rating_list.split(/\s*,\s*/).each do |rating|
    if uncheck.nil?
      step %Q{I check "ratings_#{rating}"}
    else
      step %Q{I uncheck "ratings_#{rating}"}
    end
  end
end

Then /I should see all of the movies/ do
  # Make sure that all the movies in the app are visible in the table
  rows = page.all("table#movies>tbody tr").count
  expect(rows).to eq Movie.count
end
