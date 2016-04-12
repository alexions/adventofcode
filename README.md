http://adventofcode.com/

Each task from the http://adventofcode.com/ site in 5 languages: Erlang, PHP, NodeJS/CoffeeScript, Python, Golang  
Vagrant Box in the repo based on CentOS 7.2 and has all required environments to run tasks for different languages

Installation
=============================================================

Clone repo to your machine and run Vagrant Box

    $ git clone git@github.com:alexions/adventofcode.git
    $ cd adventofcode
    $ vagrant up

Usage
=============================================================

Login to the box, go to the /vagrant/tasks. Choose your day (e.g. day-1) and run `make`. Follow up the instructions in make file

    $ vagrant ssh
    Last login: Thu Mar 24 22:09:47 2016 from localhost
    [vagrant@aoc ~]$ cd /vagrant/tasks/day-1/
    [vagrant@aoc day-1]$ make
    'make input' - Create the input.txt file.
    'make run ENV' - Run specified env
        ENV = erl | go | node | php | python
    'make run all' - Run all envs
    [vagrant@aoc day-1]$ make run erl

