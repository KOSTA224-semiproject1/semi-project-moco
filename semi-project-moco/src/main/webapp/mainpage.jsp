<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="container text-center" style="padding: 0px 100px">
	<div id="welcomText1" class="animated1" style="margin-top:180px; opacity:0;">
		<h1 style="font-size:50px; font-weight: 900;">W&nbsp;E&nbsp;L&nbsp;C&nbsp;O&nbsp;M&nbsp;E&nbsp;&nbsp;&nbsp;&nbsp;M&nbsp;O&nbsp;C&nbsp;O&nbsp;!</h1>
	</div>
	<div style="margin-top: 50px;">
		<img id="monitor" class="animated2" src="images/monitor.png" style="width: 200px; margin-right: 50px; opacity: 0;">
		<img id="code" class="animated3" src="images/code.png" style="width: 130px; margin-left: 50px; opacity: 0;">
	</div>
	<div id="welcomText2" class="animated4" style="margin-top:50px; opacity:0;">
		<h3 style="font-size:30px; font-weight: 700;">모코에서 질문하세요</h3>
	</div>
	<div id="welcomText3" class="animated4" style="margin-top:30px; opacity:0;">
		<h3 style="font-size:25px; font-weight: 700;">코딩이 재미있어 질거에요😁</h3>
	</div>
	<div id="con" class="row row-cols-1 row-cols-md-2 animated1" style="margin-top: 400px; opacity: 0; margin-bottom: 100px;">
	     <div class="col mb-4" id="javaBoard">
	          <div class="card text-center boxShadow boardCard">
	            <div class="card-header">
	                 Java 질문 게시판
	            </div>
	               <div class="card-body">
					<div class="lang-img-box align-middle">
						<img src="images/java.png" class="card-img-top lang-img" alt="...">
					</div>
	 				</div>
	          	</div>
	     </div>
	     <div class="col mb-4" id="cBoard">
	          <div class="card text-center boxShadow boardCard">
	            <div class="card-header">
	                 C 질문 게시판
	            </div>
	               <div class="card-body">
					<div class="lang-img-box align-middle">
						<img src="images/c.png" class="card-img-top lang-img" alt="...">
					</div>
	 				</div>
	          </div>
	     </div>
	     <div class="col mb-4" id="pythonBoard">
	          <div class="card text-center boxShadow boardCard">
	            <div class="card-header">
	                 Python 질문 게시판
	            </div>
	               <div class="card-body">
					<div class="lang-img-box align-middle">
						<img src="images/python.png" class="card-img-top lang-img" alt="...">
					</div>
	 				</div>
	          </div>
	     </div>
	     <div class="col mb-4" id="etcBoard">
	          <div class="card text-center boxShadow boardCard">
	            <div class="card-header">
	                 기타언어 질문 게시판
	            </div>
	               <div class="card-body">
					<div class="lang-img-box align-middle">
						<img src="images/etc.png" class="card-img-top lang-img" alt="...">
					</div>
	 				</div>
	          </div>
	     </div>
	</div>
</div>