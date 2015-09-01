<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page session="true" %>

<html>
<head>
    <title>Вхід</title>
    <jsp:include page="static/staticFiles.jsp"/>
</head>
<body>

<div class="container">

    <div class="row">
        <div class="col-md-6 col-md-offset-3">

            <c:if test="${not empty error}">
                <div class="bs-example">
                    <div class="alert alert-danger alert-error">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>Помилка!</strong> <c:out value="${error}"/>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty success}">
                <div class="bs-example">
                    <div class="alert alert-success">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>Успішно!</strong> <c:out value="${success}"/>
                    </div>
                </div>
            </c:if>

            <c:if test="${not empty logout}">
                <div class="bs-example">
                    <div class="alert alert-success">
                        <a href="#" class="close" data-dismiss="alert">&times;</a>
                        <strong>Успішно!</strong> <c:out value="${logout}"/>
                    </div>
                </div>
            </c:if>

            <div class="panel">

                <!-- Page header -->
                <div class="panel-heading">
                    <div class="row">
                        <h3 align="center">Ввійти</h3>
                    </div>
                    <hr>
                </div>
                <!-- Page header -->

                <!-- Login form -->
                <div class="panel-body">
                    <form role="form"
                          action="<c:url value='/j_spring_security_check' />" method="post">

                        <div class="form-group">
                            <label>Ім'я:</label>
                            <input type="text" name="username" class="form-control" placeholder="Введіть ім'я">
                        </div>
                        <div class="form-group">
                            <label>Пароль:</label>
                            <input type="password" class="form-control" name="password" placeholder="Введіть пароль">
                        </div>

                        <div class="form-group text-center">
                        </div>

                        <div class="form-group">
                            <button type="submit" name="submit" value="submit" class="btn btn-primary btn-block"> Ввійти
                            </button>

                            <input type="hidden" name="${_csrf.parameterName}" class="btn btn-primary"
                                   value="${_csrf.token}"/>

                            <a href="/registration" style="text-align: center; display: block; padding-top: 15px">
                                Зареєструватися </a>
                        </div>
                        <hr>
                    </form>
                    <!-- Login form -->
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="static/footer.jsp" flush="true"/>

</body>
</html>