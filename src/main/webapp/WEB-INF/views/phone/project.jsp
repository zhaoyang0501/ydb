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
			<section class="ui-panel">
			    <h2 class="ui-arrowlink">全部分类</h2>
				  <ul class="ui-list ui-list-function ui-list-link ui-border-tb">
               
               <c:forEach items="${projects }" var="bean">
                 <li class="ui-border-t" data-href="${pageContext.request.contextPath}/phone/order/${bean.id }">
                    <div class="ui-avatar-s">
                        <span style="background-image:url(${pageContext.request.contextPath}/images/1.png)"></span>
                    </div>
                    <div class="ui-list-info">
                        <h4 class="ui-nowrap ui-txt-warning">${bean.name }</h4>
                    </div>
                    <div class="ui-btn" >预订</div>
                </li>
               </c:forEach>
              
               
            </ul>
			</section>


        </section><!-- /.ui-container-->
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