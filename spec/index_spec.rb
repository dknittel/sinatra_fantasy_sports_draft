require_relative 'spec_helper'
describe "index" do
	it 'should route to home page' do
		get '/'
		expect(last_response.status).to eq(200)
	end


	describe 'drafts/new' do
		it 'should route to drafts creation page' do
			post '/register', login: 'm', password: 'k', confirm: 'k'
			# p auth_logged_in?
			get '/drafts/new'
			expect(last_response.status).to eq(302)
		end

		it 'should create the specified number of teams' do

			# expect{post '/drafts', num_teams: 4}.to change{Team.all.count}.by(4)
		end
	end

	describe 'drafts/:key => "value", id/teams' do
		it 'should route to create teams page' do
			@draft = Draft.create
			get "/drafts/#{@draft.id}/teams"
			expect(last_response.status).to eq(200)
		end

		it 'should set the team names' do
			# post '/drafts/:id/teams' {}
		end
	end

end
