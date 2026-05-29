<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="model.JavaBeans"%>
<%@ page import="java.util.ArrayList"%>

<%
String usuario = (String) session.getAttribute("usuario");

if (usuario == null) {
	response.sendRedirect("login.html");
}
%>

<%
ArrayList<JavaBeans> lista = (ArrayList<JavaBeans>) request.getAttribute("lista");
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Dados dos clientes</title>

<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body>

	<header class="bg-white shadow-sm py-3 mb-4 border-bottom">
		<div class="container d-flex justify-content-between align-items-center">
			<h4 class="m-0 text-dark">Lista de Clientes</h4>
			<a href="central.jsp" class="btn btn-outline-primary">Voltar</a>
		</div>
	</header>

	<div class="container-fluid px-4">

		<div class="table-responsive">

			<table class="table table-bordered table-hover table-striped align-middle text-center">

				<thead class="table-light">
					<tr>
						<th>Id</th>
						<th>Nome</th>
						<th>CPF</th>
						<th>Empresa</th>
						<th>CNPJ</th>
						<th>Telefone</th>
						<th>Email</th>
						<th>Nascimento</th>
						<th>Sexo</th>
						<th>Estado</th>
						<th>Seguros</th>
						<th>Indicou</th>
						<th>Observação</th>
						<th>Documento PDF</th>
						<th>Ações</th>
					</tr>
				</thead>

				<tbody class="table-group-divider">

					<%
					if (lista != null) {
						for (int i = 0; i < lista.size(); i++) {
					%>

					<tr>
						<td><%=lista.get(i).getId()%></td>
						<td><%=lista.get(i).getNome()%></td>
						<td><%=lista.get(i).getCpf()%></td>
						<td><%=lista.get(i).getEmpresa()%></td>
						<td><%=lista.get(i).getCnpj()%></td>
						<td><%=lista.get(i).getTelefone()%></td>
						<td><%=lista.get(i).getEmail()%></td>
						<td><%=lista.get(i).getNascimento()%></td>
						<td><%=lista.get(i).getSexo()%></td>
						<td><%=lista.get(i).getEstado()%></td>

						<td>
							<span class="badge bg-primary">
								<%=lista.get(i).getSeguros()%>
							</span>
						</td>

						<td><%=lista.get(i).getIndicou()%></td>

						<td style="max-width: 250px; word-wrap: break-word; white-space: normal;">
							<%=lista.get(i).getObservacao()%>
						</td>

						<td>
							<%
							if (lista.get(i).getDocumento() != null) {
							%>
							<div class="d-flex justify-content-center">
								<a href="view?id=<%=lista.get(i).getId()%>" target="_blank"
									class="btn btn-outline-success">
									Abrir
								</a>
							</div>
							<%
							} else {
								out.print("<span class='text-muted'>-</span>");
							}
							%>
						</td>

						<td>
							<div class="d-flex flex-column align-items-center gap-1">

								<a href="select?id=<%=lista.get(i).getId()%>"
									class="btn btn-outline-primary btn-sm d-flex justify-content-center align-items-center" style="width: 44px; height: 34px;">
									<i class="bi bi-pencil"></i>
								</a>

								<a href="delete?id=<%=lista.get(i).getId()%>"
									class="btn btn-outline-danger btn-sm d-flex justify-content-center align-items-center"
									onclick="return confirm('Tem certeza?')" style="width: 44px; height: 34px;">
									<i class="bi bi-trash"></i>
								</a>

							</div>
						</td>
					</tr>

					<%
						}
					}
					%>

				</tbody>

			</table>
		</div>
	</div>

</body>
</html>