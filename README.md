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
```

Gosu also allows users to alter the grid dimensions that the game takes place in. This is done in by changing the default height and width values in the initialize method found in 'gosu_gol.rb'

## Visualisation with Gosu 

(![image](https://user-images.githubusercontent.com/51751467/115248677-cec4e380-a11f-11eb-83b4-7b7eed4eab13.png).png)
