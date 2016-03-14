<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
        <meta name="format-detection" content="telephone=no">
        <title>FrozenUI Demo</title>
        <script type="text/javascript" src="http://tajs.qq.com/stats?sId=37342703" charset="UTF-8"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/frozen.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/demo.css">
        <script src="${pageContext.request.contextPath}/lib/zepto.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/frozen.js"></script>
    </head>
    
    <body ontouchstart>
       	<%@include file="./header.jsp" %>
         <section class="ui-container">
			
<section id="table">
    <div class="demo-item">
        <p class="demo-desc">全部订单</p>
        <div class="demo-block">
            <table class="ui-table ui-border-tb">
                <thead>
                <tr><th>订单名称</th><th>预订日期</th><th>总价</th><th>状态</th></tr>
                </thead>
                <tbody>
                <c:forEach items="${orders }"  var="bean">
                <tr>
                	<td>${bean.project.name }</td>
                	<td><fmt:formatDate value="${bean.orderDate}" pattern="yyyy-MM-dd"/> </td>
                	<td>${bean.toalprice}</td>
                	<td><div class="ui-badge">${bean.state}</div></td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</section>
		</section>
        <script>
        $('.ui-list li,.ui-tiled li').click(function(){
            if($(this).data('href')){
                location.href= $(this).data('href');
            }
        });
        $('.ui-header .ui-btn').click(function(){
            location.href= 'index.html';
        });
        </script>
    </body>
</html>