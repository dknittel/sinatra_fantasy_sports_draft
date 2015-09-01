helpers do
  def em(text)
    "<em>#{text}</em>"
  end

  def counter
    Player.count
    #loop through all players and push them in an array, pop off the end of the array each time you loop through. When array is empty, you're done
    #I don't think this will work because we're not gonna select every player AND it won't let you keep track of the rounds of the draft

    #Simplify by doing one round. If you were to do multiple rounds, do this: /round/id/pick/{team.id + round.id * Team.count}  
  end
end