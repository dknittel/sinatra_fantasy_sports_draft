change num of players per team to at least 5, create options for pool on draft_new page so user knows what to enter, test site, If time: put a "select number of players per team" input on drafts/new page, create more errors and validations for user input

BUG: when you click view stats, the page refreshes so all the players that were picked come back. Solution: ajax to and from the view stats page so the drafts page never resets

write rspec tests

add filter button so you can filter by team, position. Maybe a sort button too but these might have the issue with below:
sort players by ppg?: don't use draftees and just do players orderby(points).each => now the complete page is registering the wrong players being selected so the complete page displays wrong players: (SOLUTION create a :ppg_rank column in player table that you create in seed file and have ajax call select player based on that)
erb code for above:
<div class="players2">
  <div id="available-players">
    <% Player.order(points: desc).each do |player|%>
    <div class="inline1">
      <%= player.name %>
      <a class="white_text btn btn-primary inline1" href="/drafts/<%= @draft.id %>/players/<%= player.id %>">View Stats</a>
      <form method="post" action="/drafts/<%= @draft.id %>" class="inline1"><input class="btn btn-primary select-player inline1" type="submit" value="Select Player"/></form>
    </br>
  </div>
  <% end %>
</div>
</div>

<div class="players2">
  <div id="available-players">
    <% Draftee.where(team_id: nil, draft_id: @draft.id).each do |draftee|%>
    <div class="inline1">
      <%= draftee.player.name %>
      <a class="white_text btn btn-primary inline1" href="/drafts/<%= @draft.id %>/players/<%= draftee.player.id %>">View Stats</a>
      <form method="post" action="/drafts/<%= @draft.id %>" class="inline1"><input class="btn btn-primary select-player inline1" type="submit" value="Select Player"/></form>
    </br>
  </div>
  <% end %>
</div>
</div>
</div>


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
