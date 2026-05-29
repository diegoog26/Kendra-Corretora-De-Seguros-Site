<%@ page import="model.JavaBeans"%>

<%
String usuario = (String) session.getAttribute("usuario");
if (usuario == null) {
	response.sendRedirect("login.html");
}
%>

<%
JavaBeans contato = (JavaBeans) request.getAttribute("contato");
%>

<!DOCTYPE html>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Editar Cliente</title>

<link rel="stylesheet" href="style.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Inter&family=Montserrat&display=swap"
	rel="stylesheet">
</head>

<body>

	<header>
		<div class="container">
			<div id="logo">
				<a href="index.html"><img src="./img/logo.png"
					alt="Logo da Kendra Seguros"></a>
			</div>

			<nav>
				<ul>
					<li><a href="central.jsp" class="btn">Voltar</a></li>
				</ul>
			</nav>
		</div>
	</header>

	<section id="cadastrocliente">

		<div class="container">

			<h2>Editar dados</h2>

			<form action="update" name="frmContato" method="post"
				enctype="multipart/form-data" onsubmit="return validarcliente()">
				<input type="hidden" name="id" value="<%=contato.getId()%>">
				<input type="text" name="nome" placeholder="Seu nome"
					value="<%=contato.getNome()%>"> 
					
				<input type="text"
					name="cpf" placeholder="CPF" value="<%=contato.getCpf()%>">
					
				<input type="text" name="empresa" placeholder="Empresa"
					value="<%=contato.getEmpresa()%>"> 
					
				<input type="text"
					name="cnpj" placeholder="CNPJ" value="<%=contato.getCnpj()%>">
					
				<input type="tel" name="telefone" placeholder="Telefone"
					value="<%=contato.getTelefone()%>"> 
					
				<input type="email"
					name="email" placeholder="Email" value="<%=contato.getEmail()%>">
					
				<input type="date" name="nascimento"
					value="<%=contato.getNascimento()%>"> 

				<select name="sexo">
					<option selected>
						<%=contato.getSexo()%>
					</option>
					<option value="Masculino">Masculino</option>
					<option value="Feminino">Feminino</option>
					<option value="Outro">Outro</option>
				</select> 

				<select name="estado">
					<option selected>
						<%=contato.getEstado()%>
					</option>
					<option value="Solteiro(a)">Solteiro</option>
					<option value="Casado/União">Casado/União</option>
					<option value="Viúvo(a)">Viúvo(a)</option>
					<option value="Separado(a)">Separado(a)</option>
				</select> 

				<select name="seguros">
					<option selected>
						<%=contato.getSeguros()%>
					</option>
					<option value="Saúde">Saúde</option>
					<option value="Auto">Auto</option>
					<option value="Vida">Vida</option>
					<option value="Odontológico">Odontológico</option>
					<option value="Residencial">Residencial</option>
					<option value="Empresarial">Empresarial</option>
					<option value="Consórcio">Consórcio</option>
				</select> 

				<input type="text" name="indicou" placeholder="Quem indicou"
					value="<%=contato.getIndicou()%>"> 

				<input type="file"
					name="documento" id="file" accept=".pdf,.jpg,.png"
					placeholder="Anexar documento">

				<textarea name="observacao"><%=contato.getObservacao()%></textarea>

				<button class="btn" type="submit">Salvar</button>
			</form>

		</div>

	</section>

	<footer>
		<div class="container">
			<div class="kendra">
				<h2>Sobre a Kendra</h2>
				<p>A Kendra Seguros nasceu do sonho de uma ex-funcionária do
					setor, que acredita que seguro vai além de uma simples venda: é uma
					consultoria personalizada, focada em entender e atender as reais
					necessidades de cada cliente.</p>
			</div>

			<div class="contatos">
				<h2>Contatos</h2>
				<a href="https://wa.me/5511947171460" target="_blank"><img
					src="./img/whatsapp.png" alt="">WhatsApp</a> 
					
				<a href="mailto:tatiana@kendraseguros.com.br" target="_blank"><img
					src="./img/e-mail.png" alt="">Email</a>
			</div>

			<div class="informacoes">
				<h2>Informações</h2>
				<a href="privacidade.html" target="_blank">Política de
					Privacidade</a> 
					
				<a href="cookies.html" target="_blank">Política de
					Cookies</a> 
					
				<a href="uso.html" target="_blank">Termos de Uso</a> 
				
				<a href="aviso.html" target="_blank">Aviso Legal</a>
			</div>

			<div class="informacoes">
				<h2>Mapa do site</h2>
				<a href="#cabecalho">Cabeçalho</a> 
				<a href="#principal">Principal</a>
				<a href="#porque">Por que fazer seu seguro?</a> 
				<a href="#nosso">Nossos Seguros</a> 
				<a href="#tatiana">Conheça quem vai cuidar de você</a> 
				<a href="#reviews">Avaliações</a> 
				<a href="#parcerias">Parcerias</a>
			</div>

			<div class="redessociais">
				<h2>Redes Sociais</h2>
				<a href="https://www.instagram.com/kendraseguros/" target="_blank"><img
					src="./img/instagram.png" alt="">Instagram</a> 
					
				<a href="https://www.facebook.com/kendraseguros/" target="_blank"><img
					src="./img/facebook.png" alt="">Facebook</a> 
					
				<a href="https://br.linkedin.com/company/kendra-corretora-de-seguros"
					target="_blank"><img src="./img/linkedin.png" alt="">LinkedIn</a>
			</div>
		</div>
	</footer>

	<footer class="ela">
		<div class="container">
			<h2>
				©<span id="copyrightYear"></span>E.L.A - DEV
			</h2>
		</div>
	</footer>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="menu.js"></script>
	<script src="validadorcliente.js"></script>
</body>

</html>