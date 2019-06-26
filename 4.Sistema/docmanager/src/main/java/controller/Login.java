package controller;

import java.io.IOException;
import java.io.Serializable;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.inject.Named;
import negocio.Usuario;

@Named 
@SessionScoped //carrega objeto login na SESSION
public class Login implements Serializable{
    
    private String usuario;
    private String senha;
    private Usuario user; 
    
    public void logar() throws IOException {
        user = new Usuario(usuario,senha); //criar o objeto user com o usuario e senha informado
        
        if (user.validaUsuario()==true) { //Se os dados do usuario estiver correto, é direcionado ao index
            FacesContext.getCurrentInstance().getExternalContext().redirect("index.xhtml"); 
        } else { //caso contrario o objeto user fica null o login não é efetuado e mostra a mensam de erro
            user = null;
            FacesContext context = FacesContext.getCurrentInstance();
            context.addMessage(null, new FacesMessage(FacesMessage.SEVERITY_ERROR, "ERRO - Usuário ou Senha inválido",null));
        }
    }
    
    public void sair() throws IOException { //ao sair os dados do objeto são limpados e redireciona para tela de login
        this.user = null;
        this.usuario = null;
        this.senha = null;
        FacesContext.getCurrentInstance().getExternalContext().redirect("login.xhtml"); 
    }

    public void verificaSession() throws IOException{ //(o template chama essa tela) e é verificado se o usuário está logado
         if(user == null){ //se não tiver logado é direcionado para tela de login
           FacesContext.getCurrentInstance().getExternalContext().redirect("login.xhtml"); 
       }
    }
        
    public String getUsuario() {
        return usuario;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
   
}
