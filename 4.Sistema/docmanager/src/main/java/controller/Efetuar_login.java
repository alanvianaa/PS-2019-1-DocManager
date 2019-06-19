package controller;

import javax.inject.Named;

@Named
public class Efetuar_login {
    
    private String usuario;
    private String senha;
    
    public Boolean informar_usuario(){
        Boolean validacao = null;
        
        return validacao;
    }

    public void setUsuario(String usuario) {
        this.usuario = usuario;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }
    
    
}
