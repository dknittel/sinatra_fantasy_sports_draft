get '/' do
  erb :home
end

get '/drafts/new' do
  redirect '/' unless auth_logged_in?
  @user = auth_current_user
  erb :drafts_new
end

post '/drafts' do
  @user = auth_current_user
  @pool = Pool.find_by(name: params[:pool])

  @draft = @user.drafts.create(current_team: 1, pool_id: @pool.id)
  @draft.num_teams = params[:num_teams].to_i
  @draft.save
  @draft.num_teams.times do |draft_position|
    @draft.teams.create(name: "Team #{draft_position + 1}", draft_position: draft_position + 1)
  end
  Player.all.each do |player|
    @draft.draftees.create(player_id: player.id)
  end
  redirect "/drafts/#{@draft.id}/teams"
end

get '/drafts/:id/teams' do
  @draft = Draft.find(params[:id])
  erb :teams
end

post '/drafts/:id/teams' do
  @draft = Draft.find(params[:id])
  counter = 0
  Team.where(draft_id: @draft.id).each do |team|
    team.name = params[:team][counter]
    team.save
    counter += 1
  end
  redirect "/drafts/#{@draft.id}"
end

get '/drafts/:id' do

  @draftee = Draftee.new
  @draft = Draft.find(params[:id])
  @team = Team.where(draft_id: @draft.id).where(
draft_position: 1)
  @team.name
  if full_teams?(@draft.id)
    p 'yoooooooooooooooooooooooooooooooooooooooooooo'
    @full_teams = true
    # redirect "/drafts/#{@draft.id}/complete"
  end
  if @draft.current_team > @draft.num_teams
    @draft.current_team = 1
    @draft.save
  end
  @team = Team.where(draft_id: @draft.id).find_by(draft_position: @draft.current_team)

  if request.xhr?
    {full_teams: @full_teams, team_name: @team.name}.to_json
  else
    erb :drafts
  end
end

post '/drafts/:id' do
  @draft = Draft.find(params[:id])
  @player = Player.find_by(points_rank: params[:player_id])
  @draftee = Draftee.where(draft_id: @draft.id).find_by(player_id: @player.id)
  @team = Team.find_by(draft_position: @draft.current_team, draft_id: @draft.id)
  @draftee.team_id = @team.id
  @draftee.save
  @user = auth_current_user
  @draft.current_team += 1
  @draft.save
  redirect "drafts/#{@draft.id}"
end

get '/drafts/:id/players' do
  @draft = Draft.find(params[:id])
  @team = Team.find_by(draft_position: @draft.current_team)
  erb :players
end

get '/drafts/:id/players/:player_id' do
  @draft = Draft.find(params[:id])
  @team = Team.find_by(draft_position: @draft.current_team)
  @player = Player.find_by(id: params[:player_id])
  erb :view_stats
end

get '/drafts/:id/complete' do
  @user = auth_current_user
  @draft = Draft.find(params[:id])
  erb :complete
end



enable :sessions
set :session_secret, ENV['SESSION_SECRET'] || 'this is a secret shhhhh'


helpers do

  def auth_logged_in?
    !session[:user_id].nil?
  end

  def auth_login(user)
    session[:user_id] = user.id
  end

  def auth_logout
    session.destroy
  end

  def auth_current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def full_teams?(draft_id)
    Team.where(draft_id: draft_id).each do |team|
      p Draftee.where(team_id: team.id)
      if Draftee.where(team_id: team.id).count != 3
        return false
      end
    end
    true
  end

  # def find_players(player)
  #   suggestions = []
  #   suggestions = Player.all.map do |player|
  #     player.name
  #   end
  # end

end
