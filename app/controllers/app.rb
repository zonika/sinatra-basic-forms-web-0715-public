class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do  # INDEX
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do # SHOW
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do  # EDIT
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id' do # UPDATE
    @song = Song.find(params[:id])
    @song.update(params['song'])
    erb :'songs/show'
  end 

end

