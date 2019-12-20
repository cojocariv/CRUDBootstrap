<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

    <title>Task manager</title>
    <link rel="stylesheet" href="/static/css/bootstrap.min.css">
    <link rel="stylesheet" href="/static/css/style.css">


</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand" href="/">Bootsample</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
            <li class="nav-item">
                <a class="nav-link" href="/new-task">New task <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/all-tasks">All tasks</a>
        </ul>
    </div>
</nav>
<c:choose>

    <c:when test="${mode=='MODE_HOME'}">
        <div class="container p-3" id="homeDiv">
            <div class="jumbotron text-center">
                <h1>Welcome to task manager</h1>
            </div>
        </div>
    </c:when>

    <c:when test="${mode=='MODE_TASKS'}">
        <div class="container p-3 text-center" id="tasksDiv">
            <h3>My tasks</h3>
            <hr>
            <div class="table-responsive">
                <table class="table table-striped table-bordered text-left">
                    <thead class="thead-dark">
                    <tr>
                        <th>Id</th>
                        <th>Name</th>
                        <th>Description</th>
                        <th>Date created</th>
                        <th>Finished</th>
                        <th>Update</th>
                        <th>Delete</th>

                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="task" items="${tasks}">
                        <tr class="shadow p-3 mb-5 bg-white rounded">
                            <td>${task.id}</td>
                            <td>${task.name}</td>
                            <td>${task.description}</td>
                            <td>${task.dateCreated}</td>
                            <td>${task.finished}</td>
                            <td><a href="/update-task?id=${task.id}"><span>Update</span></a></td>
                            <td><a href="/delete-task?id=${task.id}"><span>Delete</span></a></td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </c:when>
    <c:when test="${mode=='MODE_NEW' || mode=='MODE_UPDATE'}">
        <div class="container text-center">
            <h3 class="p-2">Manage Task</h3>
            <hr>
            <form class="form-group" method="post" action="/save-task">
                <input type="hidden" name="id" value="${task.id}">
                <div class="form-group row">
                    <label for="colFormLabelLg" class="col-sm-2 col-form-label col-form-label-lg font-weight-bold">Name</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control form-control-lg" id="colFormLabelLg" name="name" value="${task.name}">
                    </div>
                </div>
                <div class="form-group row">
                    <label for="colFormLabelLg3" class="col-sm-2 col-form-label col-form-label-lg font-weight-bold">Description</label>
                    <div class="col-md-7">
                        <input type="text" class="form-control form-control-lg" id="colFormLabelLg3" name="description" value="${task.description}">
                    </div>
                </div>

                <div class="form-group row">
                    <label class="col-sm-2 col-form-label col-form-label-lg font-weight-bold">Finished</label>
                    <div class="col-lg-5 p-3 col-sm-1">
                        <input type="radio" class="col-sm-1" name="finished" value="true"/>Yes
                        <input type="radio" class="col-sm-1" name="finished" value="false"/>No
                    </div>
                </div>
                <div class="form-group">
                    <input type="submit" class="btn btn-primary" value="Save"/>
                </div>
            </form>
        </div>
    </c:when>
</c:choose>

<script src="/static/js/jquery-3.4.1.js"></script>
<script src="/static/js/bootstrap.min.js"></script>
</body>
</html>