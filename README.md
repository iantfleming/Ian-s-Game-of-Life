## Ian's Game of Life

## Code style

[![js-standard-style](https://img.shields.io/badge/code%20style-standard-brightgreen.svg?style=flat)](https://github.com/feross/standard)


## Specification

The writing below specifies the task that I had to complete:

Ian's Game of Life is my solution to the well known Conway's Game of Life, a cellular automation program devised by John Horton Conway. For an in depth description of the problem, have a look at the Game of Life [Wikipedia](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) page. Listed below are the 4 rules required for the game to work:

	- Any live cell with fewer than two live neighbours dies, as if by underpopulation.
	- Any live cell with two or three live neighbours lives on to the next generation.
	- Any live cell with more than three live neighbours dies, as if by overpopulation.
	- Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

Pretty simple, right? Well this is where it gets interesting:

	- Once the sell by date has passed, Quality degrades twice as fast
	- The Quality of an item is never negative
	- "Aged Brie" actually increases in Quality the older it gets
	- The Quality of an item is never more than 50
	- "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
	- "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

	- "Conjured" items degrade in Quality twice as fast as normal items



### Requirements

* You should be able to interact with your code via a REPL like IRB or the JavaScript console.  (You don't need to implement a command line interface that takes input from STDIN.)
* Write tests that pass when run for pre-written code.
* Refactor the pre-written code to make it more readable.

## Installation
To install the program do the following:

- Clone this repo

Run:

```
cd game-of-life
bundle install
```


## Run tests

To perform tests run:
```
rspec
```
## Use program

To run:

```
ruby gosu_gol.rb

