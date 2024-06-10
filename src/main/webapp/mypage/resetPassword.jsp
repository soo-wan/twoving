<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <title>비밀번호 재설정</title>
</head>
<body>
    <h1>비밀번호 재설정</h1>
<!-- <form action="../ResetPasswordServlet" method="post"> -->
	<form action="../ResetPasswordServlet" method="post">
<!-- twoving.do?command=idcheckForm -->
        <label for="password">새로운 비밀번호 입력 : </label>
        <input type="password" id="password" name="password" required><br><br>
        <label for="confirmPassword">비밀번호 확인 : </label>
        <input type="password" id="confirmPassword" name="confirmPassword" required><br><br>
        <input type="submit" value="비밀번호 재설정" style="cursor: pointer;">
    </form>
</body>
</html>