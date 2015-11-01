<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wish Wall-My Wishes</title>
<meta name="description" content="Your description goes here">
<meta name="keywords" content="your,keywords,goes,here">
<meta name="author" content="Your Name">
<meta name="generator" content="WYSIWYG Web Builder 10 Trial Version - http://www.wysiwygwebbuilder.com">
<link href="../css/variant-duo.css" rel="stylesheet" type="text/css">
<link href="../css/mywish.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.9.1.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	$("b").click(function(){
		alert(this.id);
		
		$("#wid").val(this.id);
		
		$("#mysub").submit();
	});
});

</script>
</head>
<body>
<div id="container">
<div id="wb_Shape1" style="position:absolute;left:13px;top:91px;width:980px;height:644px;z-index:0;">
<img src="images/img0005.gif" id="Shape1" alt="" style="width:980px;height:644px;"></div>
<div id="wb_Text1" style="position:absolute;left:14px;top:15px;width:982px;height:35px;z-index:1;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:29px;"><strong>Wish Wall</strong></span></div>
<div id="wb_Text2" style="position:absolute;left:14px;top:56px;width:982px;height:21px;z-index:2;text-align:left;">
<span style="color:#555555;font-family:tahoma;font-size:17px;">Wish at will</span></div>
<div id="wb_Text4" style="position:absolute;left:77px;top:139px;width:463px;height:21px;z-index:3;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:17px;"><strong>I Wish For :</strong></span></div>
<div id="wb_Text5" style="position:absolute;left:79px;top:185px;width:463px;height:43px;z-index:4;text-align:left;">

<div style="line-height:21px;">
	<span style="color:#333333;font-family:tahoma;font-size:12px;">

		Here my about should appear 
		<br>
		<%
			ArrayList<String> list=new ArrayList<String>();
			list=(ArrayList<String>)request.getAttribute("myname");
			
			out.println("<br>");
			
			for (int i = 0; i < (list.size()-1);) {
		        out.println("<b style='cursor: pointer; border-bottom-color: black; border-bottom-width: thick;' id="+list.get(i)+" > "+ list.get(i+1) +"</b><br>");

			  i=i+2;
		    }
		%>
	</span>
	
	<form id="mysub" method="post" action="/Myops?act=showeach">
		<input type="hidden" name="wid" id="wid">
	</form>
</div>
</div>
<div id="wb_Text8" style="position:absolute;left:636px;top:200px;width:342px;height:43px;z-index:5;text-align:left;">
<div style="line-height:21px;"><span id="mytest" style="color:#333333;font-family:tahoma;font-size:12px;">Here I should try putting friends updates</span></div>
</div>
<br>
<br>
<div id="wb_Text8" style="position:absolute;left:636px;top:400px;width:342px;height:43px;z-index:5;text-align:left;">
<div style="line-height:21px;">
	<span style="color:#333333;font-family:tahoma;font-size:12px;">
		<form method="post" action="/MyRoute?act=addnew">
			<input type="submit" name="addnew" value="AddNew">
		</form>
	</span>
</div>
</div>

<div id="wb_TabMenu1" style="position:absolute;left:608px;top:56px;width:385px;height:35px;z-index:6;overflow:hidden;">
<ul id="TabMenu1">
<li>
	<form action="/MyRoute?act=hi" method="post">
		<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="profile" id="profile" value="Profile"></a>
	</form>
</li>
<li>
		<form action="/MyRoute?act=showwall" method="post">
			<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="Wishwall" id="Wishwall" value="Wishwall"></a>
		</form>
</li>
<li><a href="#" class="active">MyWishes</a></li>
<li>

		<form action="/MyRoute?act=exit" method="post">
		<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="Exit" id="Exit" value="Exit"></a>
	</form>
	
</li>
</ul>
</div>
<hr id="Line1" style="position:absolute;left:75px;top:132px;width:467px;height:1px;z-index:7;">
<hr id="Line2" style="position:absolute;left:75px;top:169px;width:467px;height:1px;z-index:8;">
<hr id="Line3" style="position:absolute;left:636px;top:405px;width:342px;height:1px;z-index:9;">
<hr id="Line4" style="position:absolute;left:636px;top:185px;width:342px;height:1px;z-index:10;">
<a href="http://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb10.png" alt="WYSIWYG Web Builder" style="position:absolute;left:454px;top:735px;border-width:0;z-index:250"></a>
</div>
</body>
</html>