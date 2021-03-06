Paginated List of English Numbers
=================


Introduction
---------
This rails application will take a number from 1 to 1 million and display a
paginated list of numbers (in words) of every number from 1 to the number the user
has chosen.

User Stories are as follows:

```
As a User
I would like to be able to enter any number from 1 to 1 million and receive a list of numbers in between.
for my own amusement.

As a User
I would like the numbers to be displayed in words,
So that I can see how all to spell all numbers.

As a User
I want to be able to determine the number of words displayed per page.
So I'm not overwhelmed by the results.
```


How I Tackled the Challenge
-------
The first code I wrote, apart from the tests, was the service to return a number
in english words. I started by converting small numbers and working my way up. As a
result, the approach I took was a lot different to if I had started converting large numbers first.
My approach involves returning a value if it fits certain criteria. There is some recursion in there
to aid with the converting of the larger numbers.

There is a way to solve this problem which involves a recursion which reduces the number with each recursion until you get to zero, whilst also determining a prefix. This method is more
agile and can be used for nearly any number. But for the number range I am dealing with, the current service
works fine.

I have never paginated results before, so this was an opportunity to play around with
the will_paginate gem.

The program is tested using rspec and capybara.

How to use the Program
-----

Once the repo has been cloned, run bundle to download all the gems that are needed.
Since this repo has been built on rails, its simple to start the server:

```
$ rails s
```

Then visit localhost:3000 and start playing around.

To run the test suite simply use the rspec command:

```
$ rspec

```

You should see all tests go green.


Difficulties and Bugs
-----

Initially there was one bug which would stop any conversion of any number over 100. This was because the convert service had to method to deal with any number whih was over one hundred but had no value of ten (i.e every number between 101 and 109). Therefore an error was thrown every time a user would select any number above 100.

The cookie overflow problem has been solved by saving the generated numbers to a database. The only problem is that if a uses generates a list and then goes back to the index page, the list will not be wiped from the database and so will show the two lists twice. Now the only problem is that the serves takes too long to generate large numbers like 1,000,000. 

There is also no styling at the moment. This will also be fixed.

The main difficulties came when writing the Convert_Number class. I realized that the most
effective way to code this particular problem was to include a recursion somewhere. The problems came when
trying to figure out where the recursion should go and how it should work. Recursions are never easy to get
your head around.

As I said earlier, I have never paginated a list before so this was a new gem that
I had to learn. The will_paginate gem also traditionally deals with models, and although
it feels weird not having a model in my Rails app, I feel like I just don't need one for this problem.
The problems came when trying to figure out how to paginate an array and not a model. 
