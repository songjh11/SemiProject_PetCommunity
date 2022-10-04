<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    purchaseList
    <table>
    	<c:forEach items="${checkList}" var="check">
	    	<tr>
	    	<td>${check.imp_uid}</td>
			<td><a href="./purchaseDetail?merchant_uid=${check.merchant_uid}"><button>${check.merchant_uid}</button></a></td>
	    	</tr>    	
    	</c:forEach>
    </table>
</body>
</html>