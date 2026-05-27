<%@ page import="model.JavaBeans" %>

    <% String usuario=(String) session.getAttribute("usuario"); if (usuario==null) {
        response.sendRedirect("login.html"); } %>

        <% JavaBeans contato=(JavaBeans) request.getAttribute("contato"); %>

            <!DOCTYPE html>
            <html lang="pt-br">

            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Editar Cliente</title>

                <link rel="stylesheet" href="style.css">
                <link rel="preconnect" href="https://fonts.googleapis.com">
                <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
                <link href="https://fonts.googleapis.com/css2?family=Inter&family=Montserrat&display=swap"
                    rel="stylesheet">
            </head>

            <body>

                <header>
                    <div class="container">
                        <div id="logo">
                            <a href="index.html"><img src="./img/logo.png" alt="Logo da Kendra Seguros"></a>
                        </div>

                        <nav>
                            <ul>
                                <li><a href="central.jsp">Voltar</a></li>
                            </ul>
                        </nav>
                    </div>
                </header>

                <section id="cadastrocliente">

                    <div class="container">

                        <h2>Editar dados</h2>

                        <form action="update" name="frmContato" method="post" enctype="multipart/form-data"
                            onsubmit="return validarcliente()">
                            <input type="hidden" name="id" value="<%=contato.getId()%>">
                            <input type="text" name="nome" placeholder="Seu nome" value="<%=contato.getNome()%>">
                            <input type="text" name="cpf" placeholder="CPF" value="<%=contato.getCpf()%>">
                            <input type="text" name="empresa" placeholder="Empresa" value="<%=contato.getEmpresa()%>">
                            <input type="text" name="cnpj" placeholder="CNPJ" value="<%=contato.getCnpj()%>">
                            <input type="tel" name="telefone" placeholder="Telefone" value="<%=contato.getTelefone()%>">
                            <input type="email" name="email" placeholder="Email" value="<%=contato.getEmail()%>">
                            <input type="date" name="nascimento" value="<%=contato.getNascimento()%>">
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
                                <option value="Casado/Uni�o">Casado/Uni�o</option>
                                <option value="Vi�vo(a)">Vi�vo(a)</option>
                                <option value="Separado(a)">Separado(a)</option>
                            </select>
                            <select name="seguros">
                                <option selected>
                                    <%=contato.getSeguros()%>
                                </option>
                                <option value="Sa�de">Sa�de</option>
                                <option value="Auto">Auto</option>
                                <option value="Vida">Vida</option>
                                <option value="Odontol�gico">Odontol�gico</option>
                                <option value="Residencial">Residencial</option>
                                <option value="Empresarial">Empresarial</option>
                                <option value="Cons�rcio">Cons�rcio</option>
                            </select>
                            <input type="text" name="indicou" placeholder="Quem indicou"
                                value="<%=contato.getIndicou()%>">
                            <input type="file" name="documento" id="file" accept=".pdf,.jpg,.png"
                                placeholder="Anexar documento">
                            <textarea name="observacao"><%=contato.getObservacao()%></textarea>
                            <button class="btn" type="submit">Salvar</button>
                        </form>

                    </div>

                </section>
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <script src="menu.js"></script>
                <script src="validadorcliente.js"></script>
            </body>

            </html>