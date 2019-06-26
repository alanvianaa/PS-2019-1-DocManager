
package persistencia;

import java.sql.ResultSet;
import java.sql.SQLException;

public class usuarioDAO {

    private int id;
    private String usuario;
    private String senha;
    private String nomeCompleto;
    private String cpf;
    private String email;
    private int permissao;

    public boolean verificarUsuario(String usuario, String senha) { //é feito a busca do usuario no BD quando acha

        ConexaoDB con = new ConexaoDB();
        ResultSet rs = con.buscarQuery("SELECT * FROM DocManager.usuario where usuario = '" + usuario + "' and senha = '" + senha + "';");
        try {
            while (rs.next()) { //após achar ele preencher os variáveis da classe
                this.id = rs.getInt("id");
                this.nomeCompleto = rs.getString("nome_completo");
                return true;
            }
        } catch (SQLException ex) {
            System.out.println("ERRO!!! Não encontrou o usuario ################################################ ");
            return false;
        }
        return false;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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
