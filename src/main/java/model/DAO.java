package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class DAO {

	private String driver = "com.mysql.cj.jdbc.Driver";
	private String url = "jdbc:mysql://127.0.0.1:3306/kendrabanco?useTimezone=true&serverTimezone=UTC";
	private String user = "root";
	private String password = "123@senac";

	private Connection conectar() {
		Connection con = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			return con;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void testeConexao() {
		try {
			Connection con = conectar();
			System.out.println(con);
			con.close();
		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean inserirContato(JavaBeans contato) {

		String create = "insert into clientes(nome_cliente,cpf,empresa,cnpj,telefone,email,nascimento,sexo,estado,seguros,indicou,documento,observacao) values (?,?,?,?,?,?,?,?,?,?,?,?,?)";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(create);

			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getCpf());
			pst.setString(3, contato.getEmpresa());
			pst.setString(4, contato.getCnpj());
			pst.setString(5, contato.getTelefone());
			pst.setString(6, contato.getEmail());
			pst.setString(7, contato.getNascimento());
			pst.setString(8, contato.getSexo());
			pst.setString(9, contato.getEstado());
			pst.setString(10, contato.getSeguros());
			pst.setString(11, contato.getIndicou());
			pst.setBytes(12, contato.getDocumento());
			pst.setString(13, contato.getObservacao());

			pst.executeUpdate();
			con.close();

			return true;

		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public ArrayList<JavaBeans> listarContatos() {

		ArrayList<JavaBeans> contatos = new ArrayList<>();

		String read = "select * from clientes order by id";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read);
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				contatos.add(new JavaBeans(
						rs.getString("id"),
						rs.getString("cpf"),
						rs.getString("nome_cliente"),
						rs.getString("empresa"),
						rs.getString("cnpj"),
						rs.getString("telefone"),
						rs.getString("email"),
						rs.getString("nascimento"),
						rs.getString("sexo"),
						rs.getString("estado"),
						rs.getString("seguros"),
						rs.getString("indicou"),
						rs.getBytes("documento"),
						rs.getString("observacao"),
						rs.getString("data")
					));
			}

			con.close();
			return contatos;

		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public void selecionarContato(JavaBeans contato) {

		String read2 = "select * from clientes where id = ?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(read2);
			pst.setString(1, contato.getId());
			ResultSet rs = pst.executeQuery();

			while (rs.next()) {

				contato.setId(rs.getString(1));
				contato.setNome(rs.getString(2));
				contato.setCpf(rs.getString(3));
				contato.setEmpresa(rs.getString(4));
				contato.setCnpj(rs.getString(5));
				contato.setTelefone(rs.getString(6));
				contato.setEmail(rs.getString(7));
				contato.setNascimento(rs.getString(8));
				contato.setSexo(rs.getString(9));
				contato.setEstado(rs.getString(10));
				contato.setSeguros(rs.getString(11));
				contato.setIndicou(rs.getString(12));
				contato.setDocumento(rs.getBytes(13));
				contato.setObservacao(rs.getString(14));
				contato.setData(rs.getString(15));
			}

			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public boolean login(JavaBeans usuario) {

		String sql = "select * from login where nome = ? and senha = ?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, usuario.getNome());
			pst.setString(2, usuario.getSenha());

			ResultSet rs = pst.executeQuery();

			boolean ok = rs.next();
			con.close();
			return ok;

		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}

	public void deletarContato(JavaBeans contato) {

		String delete = "delete from clientes where id = ?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(delete);
			pst.setString(1, contato.getId());

			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}

	public void atualizarContato(JavaBeans contato) {

		String sql = "update clientes set nome_cliente=?, cpf=?, empresa=?, cnpj=?, telefone=?, email=?, nascimento=?, sexo=?, estado=?, seguros=?, indicou=?, documento=?, observacao=? where id=?";

		try {
			Connection con = conectar();
			PreparedStatement pst = con.prepareStatement(sql);

			pst.setString(1, contato.getNome());
			pst.setString(2, contato.getCpf());
			pst.setString(3, contato.getEmpresa());
			pst.setString(4, contato.getCnpj());
			pst.setString(5, contato.getTelefone());
			pst.setString(6, contato.getEmail());
			pst.setString(7, contato.getNascimento());
			pst.setString(8, contato.getSexo());
			pst.setString(9, contato.getEstado());
			pst.setString(10, contato.getSeguros());
			pst.setString(11, contato.getIndicou());
			pst.setBytes(12, contato.getDocumento());
			pst.setString(13, contato.getObservacao());
			pst.setString(14, contato.getId());

			pst.executeUpdate();
			con.close();

		} catch (Exception e) {
			System.out.println(e);
		}
	}
}