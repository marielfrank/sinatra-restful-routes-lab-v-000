class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/' do
    erb :index
  end

  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find_by(id: params[:id])
    # binding.pry
    erb :show
  end

  delete '/recipes/:id/delete' do
    @recipe = Recipe.find_by(id: params[:id])
    @recipe.delete
    redirect '/recipes'
  end

  get '/recipes/new' do
    erb :new
  end

  post '/recipes' do
    @recipe = Recipe.create(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    redirect "/recipes/#{@recipe.id}"
  end
end
