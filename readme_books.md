Sign up(email,name) make a profile with your information, confirmation email (devise)
redirect to welcome page, with more indepth form for more info on the user (shipping, favorite genre)(updates user table later on)
Profile page, shows books you are willing to trade
Add books to your profile, search the API by name, then stores in table by ISBN
foreignkey of book to user
Search bar to look for a book you want, type in name, returns some users who have the book
also on search page, shows small list of people with same genres
click the user, redirects to their profile
page shows other user profile, button next to each book in their booklist to click "Gimme this book"
other user then gets email notification to send their book

on your profile, nav bar to edit user info, change your bookshelf, 


user table
books table

route page has bookshelf
on bookshelf, render pictures of blank bindings, title written in using title of book in table
list of all your books below the shelf
mouse over single book to show info on it

keep track where book is, how long
heat map of loaned books
link to good reads, gem, mark on page when finished reading
definitely take use of ransack

import good reads, use functionality, they have an API
who wants this book

current APIs to use, google books, google maps, good reads api wrapper


searching for book:
search bar, type in book title
returns list with book title, user_id which joined on the id
ransack: https://www.youtube.com/watch?v=Vht9iCw8ApE