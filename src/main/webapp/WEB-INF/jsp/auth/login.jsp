<%@ page
    language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    trimDirectiveWhitespaces="true"
%>


<!DOCTYPE html>
<html>
<head>
<meta charset='UTF-8'>
<title>로그인</title>
<style>
th {
    text-align: right;
}
</style>
</head>
<body>
    <h1>로그인</h1>

    <form
        action='login'
        method='post'
    >
        <table>
            <tr>
                <th>이메일</th>
                <td><input
                    type='text'
                    name='id'
                    value='${cookie.id.value}'
                ></td>
            </tr>
            <tr>
                <th>암호</th>
                <td><input
                    type='password'
                    name='password'
                ></td>
            </tr>
            <tr>
                <th></th>
                <td><input
                    type='checkbox'
                    name='save'
                >아이디 저장</td>
            </tr>
            <tr>
                <th></th>
                <td><button>로그인</button></td>
            </tr>
        </table>
    </form>
</body>
</html>
