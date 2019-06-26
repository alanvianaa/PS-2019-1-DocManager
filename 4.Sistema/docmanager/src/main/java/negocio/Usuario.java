
package negocio;

import persistencia.usuarioDAO;

public class Usuario {

    private int id;
    private String usuario;
    private String senha;
    private String nomeCompleto;
    private String cpf;
    private String email;
    private int permissao;

    public Usuario(String usuario, String senha) {
        this.usuario = usuario;
        this.senha = senha;
    }

    public boolean validaUsuario() {

        usuarioDAO dao = new usuarioDAO();
        
        if(dao.verificarUsuario(usuario, senha) == true){
           //a busca dos dados do BD é inserida nesse objeto atual
            this.id = dao.getId();
            this.nomeCompleto = dao.getNomeCompleto();
            this.cpf = dao.getCpf();
            this.email = dao.getEmail();
            this.permissao = dao.getPermissao();
           
            return true;
        }else{
            return false;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNomeCompleto() {
        return nomeCompleto;
    }

    public void setNomeCompleto(String nomeCompleto) {
        this.nomeCompleto = nomeCompleto;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getPermissao() {
        return permissao;
    }

    public void setPermissao(int permissao) {
        this.permissao = permissao;
    }

   
}
