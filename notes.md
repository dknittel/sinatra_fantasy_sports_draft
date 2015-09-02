TRY: fantasydata: already have key, really cool actually but not sure if it will work outside of their console,
IF GET KEY: xmlstats: BEST IF you can get access to key in time; VERY specific examples with Ruby code; still waiting for invitation from them 
sportradar: need api key; seems to have good access to data and clear and simple instructions
Yahoo: seems like you have to get one player at a time
CBS: does it even have nba?



Tuesday night: pick API
wed night: read and understand documentation and do heroku
thurs day: set up key and get data from API
thurs night: finish API implementation, test site, fix CSS (on drafts page)
If time: put a "select number of players per team" input on drafts/new page


API

materialize for css

heroku

write rspec tests



Note:
value field in input in a post form is what is gonna be displayed
Must require json to get json in ajax to work
DONT NEED TO DROP DATABASE ANYMORE!

Bugs:
<!-- INSTEAD OF USING THE TEAM'S ID, YOU NEED TO USE DRAFT POSITION AND USE THE CURRENT TEAM FROM THE DRAFT TABLE TO FIND THE TEAM. THIS WILL FIX THE FACT THAT CURRENT TEAM HAS TO BE SET TO THE FIRST TEAM'S ID
for second draft, it won't end when all the teams are full -->
NO! because stu had me do "@draft.draftees.create" to make the draftees -> draftees shouldn't have draft id cuz teams have it already?

JS: (done)
ajax login and register

Tables: (done)
User has many drafts
draft has many teams
draft has many draftees
team has many draftees, but draftees start not in team
pool has many drafts
pool has many players
players has many draftees

Table attributes: (done)
state in the draft which is current team to pick
draft has a state that knows the order of teams based on their ids

Routes: (done)
setup should be drafts/new => drafts, then drafts/id

Logic: (done)
when all teams have 7 players, the draft ends (Loop through each team doing: Players.where(team_id: @team.id).count
 OR none of the Teams have a nil in any of their player attributes if you go that route)
Have a way to create team names
Need way to determine avilable players for jquery stuff: Player.where(team_id: nil)


Register: (done)
create authentication for passwords




<div class="container">

    <form id="signup" action="/register" method="post">

        <div class="header">
        
            <h3>Sign Up</h3>
            
            
        </div>
        
        <div class="sep"></div>

        <div class="inputs">
        
            <input type="email" placeholder="Login" autofocus />
        
            <input type="password" placeholder="Password" />
          <input type="password" placeholder="Confirm" name="password_confirmation" value=""/>
            

            
            <input id="submit" value="Register"/>
        
        </div>

    </form>

</div>
​
<div class="white_text">Enter Player Name:</div>

<form action="/drafts/<%= @draft.id %>" method="post">
  <input name="draftee" id="autocomplete" value= "" />
    </br>
   <input class="btn btn-primary" type = "submit" value= "Submit Pick!" />
</form>
  <% if @draftee.errors[:team].any? %>
      <div><%= @draftee.errors[:team].first %></div>
      <br>
<% end %>

<div type="button" class="btn btn-primary"><a class="white_text" href="/drafts/<%= @draft.id %>/players">View Available Players</a></div>