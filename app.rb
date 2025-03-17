require "sinatra"
require "sinatra/reloader"

get("/") do
 erb(:homepage)
end

get("/process_roll") do
  @dicerolls = params

  @num_dice = @dicerolls.fetch("dice").to_i

  @sides = @dicerolls.fetch("sides").to_i

  @rolls = []

  @num_dice.times do
    die = rand(1..@sides)

    @rolls.push(die)
  end

  erb(:processor)
end
