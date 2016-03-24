http://adventofcode.com/

Each task from the http://adventofcode.com/ site in 5 languages: Erlang, PHP, NodeJS, Python, Golang  
Vagrant Box in the repo based on CentOS 7.2 and has all required environment to run tasks for different languages

Installation
=============================================================

Clone repo to your machine and run Vagrant Box

    $ git clone git@github.com:alexions/adventofcode.git
    $ cd adventofcode
    $ vagrant up

Usage
=============================================================

Login to the box, go to the /vagrant/tasks. Choose your day (e.g. day1) and run `make`. Follow up the instructions in make file

    $ vagrant ssh
    Last login: Thu Mar 24 22:09:47 2016 from localhost
    [vagrant@aoc ~]$ cd /vagrant/tasks/day1/
    [vagrant@aoc day1]$ make
    'make input' - Create the input.txt file.
    'make run ENV' - Run specified env
        ENV = erlang | golang | nodejs | php | python
    'make run all' - Run all envs
    [vagrant@aoc day1]$ make run erlang

