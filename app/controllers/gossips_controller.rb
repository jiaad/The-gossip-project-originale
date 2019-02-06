class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end
  
  def create
    
    @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: rand(40..48))
    if @gossip.save#(validate: false)
      redirect_to "/"
      flash[:success] = "ah we t trop fort"
      return
    else
      puts "="*90
      puts @gossip.errors.full_messages
      puts "="*90
      render :new
    end
  end

  #new, #create, #show, #index, #edit, #update et #destroy
  def show
    i = params[:id].to_i
    @gossip_id = Gossip.find(i)
  end
#===================
  def index
    @gossip = Gossip.all
    @user = User.all
  end
#===================
  def edit
    i = params[:id].to_i
    @gossip = Gossip.find(i)
  end
#===================
  def update
    # @gossip = Gossip.new(title: params[:title], content: params[:content], user_id: rand(40..48))

    # @gossip = Gossip.find(params[:id].to_i)
    # if @gossip.update(user_params)
    # redirect_to "/gossips"
    # else
    #   puts "="*90
    #  puts @gossip.errors.full_messages
    #   puts "="*90
    # # render :edit
    # end
    @gossip = Gossip.find(params[:id])
    puts params.inspect
    # if @gossip.update(title: params[:title], content: params[:content])
    #   redirect_to "/gossips"
    # end
    gossip_params = params.require(:gossip).permit(:title, :content)
    if @gossip.update(gossip_params)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to "/gossips"
    else

    end
  end
#===================
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to "/gossips"
  end

end
