<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="resources/css/cadastro.css" />

<script src="https://code.jquery.com/jquery-3.2.1.min.js"
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
	crossorigin="anonymous">
	
</script>

<title>Cadastro de Usu�rio</title>
</head>
<body>
	<!-- Tela de Manipula��o da Tabela usuario do BD -->
	<a href="acessoliberado.jsp">In�cio</a>
	<a href="index.jsp">Sair</a>
	<center>
		<h1>Cadastro de Usu�rio</h1>
		<h3 style="color: orange">${msg}</h3>
	</center>
	<form action="salvarUsuario" method="post" id="formUser"
		onsubmit="return validarCampos()? true : false;"
		enctype="multipart/form-data">
		<ul class="form-style-1">
			<li>
				<table>

					<tr>
						<td>ID:</td>
						<td><input type="text" readonly="readonly" id="id" name="id"
							value="${user.id}" /></td>
						<td>CEP:</td>
						<td><input type="text" id="cep" name="cep" value=""
							onblur="consultarCep()" value="${user.cep}" /></td>
					</tr>
					<tr>
						<td>Login:</td>
						<td><input type="text" id="login" name="login"
							value="${user.login}" /></td>
						<td>Rua:</td>
						<td><input type="text" id="rua" name="rua"
							value="${user.rua}" /></td>
					</tr>
					<tr>
						<td>Senha:</td>
						<td><input type="password" id="senha" name="senha"
							value="${user.senha}" placeholder="Informe a senha" /></td>
						<td>Bairro:</td>
						<td><input type="text" id="bairro" name="bairro"
							value="${user.bairro}" placeholder="Informe o bairro" /></td>
					</tr>
					<tr>
						<td>Nome:</td>
						<td><input type="text" id="nome" name="nome"
							value="${user.nome}" placeholder="Informe o nome" /></td>
						<td>Cidade:</td>
						<td><input type="text" id="cidade" name="cidade"
							value="${user.cidade}" placeholder="Informe a cidade" /></td>
					</tr>
					<tr>
						<td>Telefone:</td>
						<td><input type="text" id="telefone" name="telefone"
							value="${user.telefone}" placeholder="Informe o telefone" /></td>
						<td>Estado:</td>
						<td><input type="text" id="estado" name="estado"
							value="${user.estado}" placeholder="Informe o estado" /></td>
					</tr>
					<tr>
						<td>IBGE:</td>
						<td><input type="text" id="ibge" name="ibge"
							value="${user.ibge}" /></td>

					</tr>
					
					<tr>
					    <td>
					        Foto:
					    </td>
					    <td><input type="file" name="foto" value="foto"></td>
					</tr>
					
					<td></td>
					<td><input type="submit" value="Salvar" /> <input
						type="submit" value="Cancelar"
						onclick="document.getElementById('formUser').action = 'salvarUsuario?acao=reset'" /></td>




				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Usu�rios Cadastrados</caption>
			<tr>
				<th>Id</th>
				<th>Nome</th>
				<th>Foto</th>
				<th>Delete</th>
				<th>Editar</th>
			</tr>
			<c:forEach items="${usuarios}" var="user">
				<tr>

					<td style="width: 150"><c:out value="${user.id}">
						</c:out></td>
						<td style="width: 150"><c:out value="${user.nome}">
						</c:out></td>
					<td><a href="salvarUsuario?acao=download&user=${user.id}"><img src ='<c:out
					     value="${user.tempFotoUser }"></c:out>' 
					alt="image User" title = "Image User" width="70px" height="35px"/></td>
					
					



					<td><a href="salvarUsuario?acao=delete&user=${user.id}"><img
							src="resources/img/icon.png" alt="Excluir" title="Excluir"
							width="32px" height="32px" /></a></td>

					<td><a href="salvarUsuario?acao=editar&user=${user.id}"><img
							src="resources/img/editar.png" alt="Editar" title="Editar" /></a></td>

					<td><a href="salvarTelefones?acao=addFone&user=${user.id}"><img
							src="resources/img/telefone.png" alt="Telefones"
							title="Telefones" width="32px" height="32px" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if (document.getElementById("login").value == '') {
				alert("Informe o Login!");
				return false;
			} else if (document.getElementById("senha").value == '') {
				alert("Informe a Senha!");
				return false;
			} else if (document.getElementById("nome").value == '') {
				alert("Informe o Nome!");
				return false;
			} else if (document.getElementById("telefone").value == '') {
				alert("Informe o Telefone!");
				return false;
			}
			return true;
		}

		function consultarCep() {
			var cep = $("#cep").val();

			$.getJSON("https://viacep.com.br/ws/" + cep + "/json/?callback=?",
					function(dados) {

						if (!("erro" in dados)) {
							$("#rua").val(dados.logradouro);
							$("#bairro").val(dados.bairro);
							$("#cidade").val(dados.localidade);
							$("#estado").val(dados.uf);
							$("#ibge").val(dados.ibge);
						} else {
							$("#cep").val('');
							$("#rua").val('');
							$("#bairro").val('');
							$("#cidade").val('');
							$("#estado").val('');
							$("#ibge").val('');
							alert("CEP n�o encontrado.");
						}
					});
		}
	</script>
</body>
</html>