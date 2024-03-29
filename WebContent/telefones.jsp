<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<link rel="stylesheet" href="resources/css/cadastro.css" />
		<title>Cadastro de Telefones</title>
	</head>
<body>
	<!-- Tela de Manipula��o de Telefones do Usu�rio -->
	<a href="acessoliberado.jsp">In�cio</a>
	<a href="index.jsp">Sair</a>
	<center>
		<h1>Cadastro de Telefones</h1>
	</center>
	
	<center><h2 style="color:orange;">${msg}</h2></center>
	<form action="salvarTelefones" method="post" id="formUser" >
		<ul class="form-style-1">
			<li>
				<table>
					<tr>
						<td>Usu�rio:</td>
						<td><input type="text" id="id" name="id" value="${userEscolhido.id}" readonly="true" /></td>
						<td><input type="text" id="nome" name="nome" value="${userEscolhido.nome}" readonly="true" /></td>
					</tr>
					<tr>
						<td>N�mero:</td>
						<td><input type="text" id="numero" name="numero" value="" /></td>
						<td>
							<select id="tipo" name="tipo" style="width:184px">
								<option>Celular</option>
								<option>Casa</option>
								<option>Trabalho</option>
								<option>Recado</option>
								<option>Outros</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td>
							<input type="submit" value="Salvar" style="width:184px" />
						</td>
						
						<td>
							<input type="submit" style="width:184px"
							value="Voltar" onclick="document.getElementById('formUser').action='salvarTelefones?acao=voltar'">
						</td>
					</tr>
					
				</table>
			</li>
		</ul>
	</form>
	<div class="container">
		<table class="responsive-table">
			<caption>Telefones Cadastrados</caption>
			<tr>
				<th>Id:</th>
				<th>N�mero:</th>
				<th>Tipo:</th>
				<th>Delete</th>
			</tr>
			<c:forEach items="${telefones}" var="fone">
				<tr>
					<td style="width:150"><c:out value="${fone.id}" ></c:out></td>
					<td style="width:150"><c:out value="${fone.numero}" ></c:out></td>
					<td style="width:150"><c:out value="${fone.tipo}" ></c:out></td>
					<td><a href="salvarTelefones?acao=deleteFone&foneId=${fone.id}">
					<img src="resources/img/icon.png" alt="Excluir" title="Excluir" width="32px" height="32px" /></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<script type="text/javascript">
		function validarCampos() {
			if(document.getElementById("numero").value == '') {
				alert("Informe o N�mero!");
				return false;
			} else if(document.getElementById("tipo").value == '') {
				alert("Informe o Tipo!");
			}
			return true;
		}
	</script>
</body>
</html>