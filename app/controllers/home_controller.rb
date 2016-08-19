class HomeController < ShopifyApp::AuthenticatedController

  #layout "application"	
  require 'HTTParty'
  require 'json'

  def index


  	# HTTParty.post('/admin/script_tags.json', {
   #    "script_tag":{
   #      "event": "onload",
   #      "display_scope": "all",
   #      "src": "https://drive.google.com/..."
   #    }
   #  })






  	if response = request.env['omniauth.auth']
      sess = ShopifyAPI::Session.new(params[:shop], response[:credentials][:token])
      session[:shopify] = sess

      ShopifyAPI::Base.activate_session(sess)
	  ShopifyAPI::ScriptTag.create(:event => "onload", :src => "https://drive.google.com/...")
    end


    if params[:id]
      status = "Hey"
      #redirect_to "http://www.aol.com"
      redirect_to "/404."
      #redirect_to "http://www.youtube.com"
      #redirect_to "http://twitter.com/home?status=#{status}"
    else
      @see = response	
      @products = ShopifyAPI::Product.find(:all, :params => {:limit => 10})
      @orders = ShopifyAPI::Order.find(:all, :params => {:limit => 10}) 
    end




    @form = Form.new
      
  end

  def create
    @form = Form.new(form_params)
    if @form.save
      flash[:notice] = "Form saved successfully."
      redirect_to(:action => 'index') 
    end  
    #redirect_to(:action => 'index') 
  end 

end

private

    def form_params
      params.require(:form).permit(:first_name, :last_name)
    end


