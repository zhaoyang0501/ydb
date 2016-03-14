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
			<c:if test="${tip!=nul}">
        	 <div class="ui-tooltips ui-tooltips-guide">
                <div class="ui-tooltips-cnt ui-border-b">
                    <i></i>${tip }<a class="ui-icon-close"></a>
                </div>
            </div>
        </c:if>
        <p class="demo-desc">填写表单预订--${project.name }</p>
        <div class="demo-block">
        
            <div class="ui-form ui-border-t">
                <form action="${pageContext.request.contextPath}/phone/doorder/${project.id}">
                   <div class="ui-form-item ui-form-item-l ui-border-b">
                        <label class="ui-border-r">预订日期</label>
                        <div class="ui-select-group">
                            <div class="ui-select">
                                <select name='year'>
                                    <option>2014</option>
                                    <option >2015</option>
                                    <option selected="">2016</option>
                                </select>
                            </div>
                            <div class="ui-select">
                                <select name='month'>
                                    <option>03</option>
                                    <option selected="">04</option>
                                    <option>05</option>
                                </select>
                            </div>
                            <div class="ui-select">
                                <select name='day'>
                                    <option>21</option>
                                    <option selected="">22</option>
                                    <option>23</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="ui-form-item ui-form-item-l ui-border-b">
                        <label class="ui-border-r">
                            	联系电话
                        </label>
                        <input name='tel' type="text" placeholder="请输入手机号码" />
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    <div class="ui-form-item ui-form-item-l ui-border-b">
                        <label class="ui-border-r">
                          	  备注
                        </label>
                        <input name="remark" type="text" placeholder="备注" />
                        <a href="#" class="ui-icon-close">
                        </a>
                    </div>
                    
                   <div class="ui-form-item ui-form-item-l ui-border-b">
                        <label class="ui-border-r">
                          	  详细地址
                        </label>
                        <textarea name='addr' placeholder="街道等详细地址"></textarea>
                    </div>
                    <div class="ui-btn-wrap">
                <button class="ui-btn-lg ui-btn-primary" type="submit">
                  		 提交订单
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