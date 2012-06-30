require './game/sudoku'
require './game/sudoku_checker'
require './game/tests'

start = Time.now
positive_test = Game::Tests::EXAMPLES[0][:sudoku]
puts Game::SudokuChecker.new(positive_test).check
puts Time.now - start

start = Time.now
negative_test = Game::Tests::EXAMPLES[1][:sudoku]
puts Game::SudokuChecker.new(negative_test).check
puts Time.now - start

start = Time.now
puts Game::Tests.check_all.to_s
puts Time.now - start
