Feature: display list of movies sorted by different criteria

  As an avid moviegoer
  So that I can quickly browse movies based on my preferences
  I want to see movies sorted by title or release date

Background: movies have been added to database

  Given the following movies exist:
  | title                   | rating | release_date |
  | Aladdin                 | G      | 25-Nov-1992  |
  | The Terminator          | R      | 26-Oct-1984  |
  | When Harry Met Sally    | R      | 21-Jul-1989  |
  | The Help                | PG-13  | 10-Aug-2011  |
  | Chocolat                | PG-13  | 5-Jan-2001   |
  | Amelie                  | R      | 25-Apr-2001  |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   |
  | The Incredibles         | PG     | 5-Nov-2004   |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |
  | Chicken Run             | G      | 21-Jun-2000  |

  And I am on the RottenPotatoes home page
  Then 10 seed movies should exist

Scenario: sort movies alphabetically
  # Scenario for Movie Title Sorting
  When I follow "Movie Title"
  # step(s) to check the 'R' and 'G' Ratings
  When I check the following ratings:R, G
  # step to "submit" the search form on the homepage
  When I press "ratings_submit"
  # step(s) to ensure Sorting is proper
  Then I should see "Aladdin" before "Amelie"
  

Scenario: sort movies in increasing order of release date
  # Scenario for Release Date Sorting
  When I follow "Release Date"
  # step(s) to check the 'R' and 'G' Ratings
  When I check the following ratings:PG-13, PG
  # step to "submit" the search form on the homepage
  When I press "ratings_submit"
  # step(s) to ensure Sorting is proper
  Then I should see "Raiders of the Lost Ark" before "The Incredibles"
