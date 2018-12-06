class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  #GET all
  def index
    @contacts = Contact.all
  end

  #GET com id de parametro
  def show
  end

  #GET renderiza formulario para novos dados
  def new
    @contact = Contact.new
  end

  #POST recebe novos dados do formulário a serem criados
  def create
    @contact = Contact.new(contact_params)
    if @contact.save 
      redirect_to contacts_index_path
    else 
      render :new, notice: "Não foi possível criar um novo contato"
    end
  end

  #GET renderiza formulario. recebe id de parametro
  def edit
  end

  #POST/PUT recebe dados do formulario a serem atualizados
  def update
    if @contact.update
      redirect_to contacts_index_path
    else
      render :new, notice: "Não foi possível editar o contato"
    end
  end

  #DELETE - apaga registro. recebe id de parametro  
  def destroy
    @contact.destroy
    redirect_to contacts_index_path
  end

  private
    #busca contato
    def set_contact 
      @contact = Contact.find(params[:id])     
    end
    
    #segurança - valida quais parametros sao permitidos 
    def contact_params
      params.require(:contact).permit(:name)      
    end
    
end
