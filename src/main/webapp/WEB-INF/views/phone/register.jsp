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
			<section id="form">
			
			
			<div class="demo-item">
        <div class="demo-block">
        <c:if test="${tip!=null }">
        <div class="ui-tooltips ui-tooltips-warn">
                <div class="ui-tooltips-cnt ui-tooltips-cnt-link ui-border-b">
                    <i></i>${tip }
                </div>
            </div>
        </c:if>
         	
            <div class="ui-form ui-border-t">
                <form action="${pageContext.request.contextPath}/phone/doregister">
                    <p class="demo-desc">完善注册信息</p>
                    <div class="ui-form-item ui-border-b">
                        <label>
                          	姓名
                        </label>
                        <input type="text" placeholder="姓名" name='name'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    
                    <div class="ui-form-item ui-border-b">
                        <label>
                          	 用户名
                        </label>
                        <input type="text" placeholder="用户名"  name="username"/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    
                   <div class="ui-form-item ui-border-b">
                        <label>
                          	 密码 
                        </label>
                        <input type="password" placeholder="密码"   name="password"/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    
                     <div class="ui-form-item ui-border-b">
                        <label>
                          	电子邮箱
                        </label>
                        <input type="text" placeholder="电子邮箱"   name='email'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                     <div class="ui-form-item ui-border-b">
                        <label>
                          	电话
                        </label>
                        <input type="text" placeholder="电话"    name='tel'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    <div class="ui-form-item ui-border-b">
                        <label>
                          	年龄
                        </label>
                        <input type="text" placeholder="年龄"   name='age'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    
                    <div class="ui-form-item ui-border-b">
                        <label>
                        	  学校或者单位
                        </label>
                        <input type="text" placeholder="学校或者单位"   name='grade'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                     <div class="ui-form-item ui-border-b">
                        <label>
                        	住址
                        </label>
                        <input type="text" placeholder="地址"   name='address'/>
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                     <div class="ui-btn-wrap">
                <button class="ui-btn-lg ui-btn-primary" type="submit">
                  确定
                </button>
            </div>
           
                </form>
            </div>
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