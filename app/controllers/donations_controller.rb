class DonationsController < ApplicationController
  def create
  	@donation = Donation.create email: params[:donation][:email], 
  	                            value: params[:donation][:value]
    
    if @donation.valid?
      #redireciona para a route para exibir a donation
      redirect_to donation_path @donation
    else
      render "home/index", :flash => { :error => "Parâmetros inválidos!" }
    end
  end
  
  def show
  	#active record base: method_missing(msg, *params, &block) 
  	#                     -> does not understand
  	#                     -> cria o metodo select by id e coloca em um cache
  	# 					  -> na prox vez que chamar, usa o metodo diretamente.
    @donation = Donation.find_by_id(params[:id])
  end

end
