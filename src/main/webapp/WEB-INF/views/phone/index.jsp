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
        <link rel="stylesheet" href="../css/frozen.css">
        <link rel="stylesheet" href="demo.css">
        <script src="../lib/zepto.min.js"></script>
        <script src="../js/frozen.js"></script>
    </head>
    
    <body ontouchstart>
  	<%@include file="./header.jsp" %>
       <section class="ui-container">
			<section id="slider">
			    <div class="demo-item">
			        <div class="demo-block">
			            <div class="ui-slider">
			                <ul class="ui-slider-content" style="width: 300%">
			                    <li><span style="background-image:url(${pageContext.request.contextPath}/img/bg40.jpg)"></span></li>
			                    <li><span style="background-image:url(${pageContext.request.contextPath}/img/bg40.jpg)"></span></li>
			                   <li><span style="background-image:url(${pageContext.request.contextPath}/img/bg40.jpg)"></span></li>
			                </ul>
			            </div>
			        </div>
			        <script class="demo-script">
			        (function (){
			            var slider = new fz.Scroll('.ui-slider', {
			                role: 'slider',
			                indicator: true,
			                autoplay: true,
			                interval: 3000
			            });
			
			            slider.on('beforeScrollStart', function(fromIndex, toIndex) {
			                console.log(fromIndex,toIndex)
			            });
			
			            slider.on('scrollEnd', function(cruPage) {
			                console.log(cruPage)
			            });
			        })();
			        </script>
			    </div>
			</section>

			<section class="ui-panel">
			    <h2 class="ui-arrowlink">猜你喜欢</h2>
				  <ul class="ui-list ui-list-link ui-border-tb">
					  <c:forEach items="${likes }" var="bean">
					  <li class="ui-border-t" data-href="${pageContext.request.contextPath}/phone/order/${bean.id }">
	                    <div class="ui-avatar">
	                             <span style="background-image:url(../images/1.png)"></span>
	                    </div>
	                    <div class="ui-list-info">
	                        <h4 class="ui-nowrap">${bean.name }</h4>
	                         <div class="ui-badge-num">${bean.category.name }</div>
	                    </div>
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