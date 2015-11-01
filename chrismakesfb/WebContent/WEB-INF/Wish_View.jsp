<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Wish Wall- See my wish</title>
<meta name="description" content="Your description goes here">
<meta name="keywords" content="your,keywords,goes,here">
<meta name="author" content="Your Name">
<meta name="generator" content="WYSIWYG Web Builder 10 Trial Version - http://www.wysiwygwebbuilder.com">
<link href="../cssvariant-duo.css" rel="stylesheet" type="text/css">
<link href="../css/Wish_View.css" rel="stylesheet" type="text/css">

<script src="../js/jquery-1.9.1.js"></script>

<script type="text/javascript">

$(document).ready(function(){
	$("#TextArea1").click(function(){
	//	alert(this.id);
		
	});
	
	$("#mycom").click(function(){
		//alert(this.id);
		
			var coid=$('#cid').val();
			//alert("I got cid"+coid);
				var param={cid:coid,act:"getcomment"};
				 $.ajax({  
	                 url:'Myops',  
	                 type:'post',  
	                 data:param,  
	                 success: function(data) {  
	                	        	
	                	 data = $.parseJSON(data);
	                	 $.each(data, function(i, item) {
	                	     
	                		 $("#com2").append(item + "<br>");
	                	 });
	                	 
	                 }  
	             }); 
	});
	 $("#ask").toggle("fast");
	$("#publish").toggle("fast");
	
	$("#addcomment").toggle("fast");
	
	$("#fulfill").click(function(){
		
		var coid=$('#cid').val();
		//alert("I got cid"+coid);
			var param={cid:coid,act:"fulfill"};
			 $.ajax({  
                 url:'Myops',  
                 type:'post',  
                 data:param,  
                 success: function(data) {  
                	        	
                	 $("#com2").append(data);
                	 $("#ask").toggle("slow");
                 }  
             }); 
	});
	
	$("#saythanks").click(function(){
		
		var coid=$('#cid').val();
		//alert("I got cid"+coid);
			var param={cid:coid,act:"saythanks"};
			 $.ajax({  
                 url:'Myops',  
                 type:'post',  
                 data:param,  
                 success: function(data) {  
                	        	
                	 $("#fid").val(data);
                	 
                	
                 }  
             });
		//	 testAPI();
		$("#saythanks").toggle("slow");
		$("#publish").toggle("slow");
	});
	
	$("#addcomm").click(function(){
		
		var desc=$('#desc').val();
		var uname=$('#uname').val();
		var coid=$('#cid').val();
		//alert("I got cid"+coid);
		 	var param={cid:coid,act:"addcomment",uname:uname,desc:desc};
			 $.ajax({  
	             url:'Myops',  
	             type:'post',  
	             data:param,  
	             success: function(data) {  
	            	        	
	            	 $("#com2").append(data);
	            	 
	            	
	             }  
	         }); 
		//	 testAPI();
		
	});

	$("#comment").click(function(){
	
		$("#addcomment").toggle("slow");
	});

});




</script>

<script>
var abtme=null;
window.fbAsyncInit = function() {
	FB.init({
	appId : '1567073246896500',
	cookie : true, // enable cookies to allow the server to access 
	// the session
	xfbml : true, // parse social plugins on this page
	version : 'v2.1' // use version 2.1
	});

		// Now that we've initialized the JavaScript SDK, we call 
		// FB.getLoginStatus(). This function gets the state of the
		// person visiting this page and can return one of three states to
		// the callback you provide. They can be:
		//
		// 1. Logged into your app ('connected')
		// 2. Logged into Facebook, but not your app ('not_authorized')
		// 3. Not logged into Facebook and can't tell if they are logged into
		// your app or not.
	//
		// These three cases are handled in the callback function.

	FB.getLoginStatus(function(response) {
	statusChangeCallback(response);
	});

	};
	
	(function(d, s, id) {
		var js, fjs = d.getElementsByTagName(s)[0];
		if (d.getElementById(id)) return;
		js = d.createElement(s); js.id = id;
		js.src = "//connect.facebook.net/en_US/sdk.js";
		fjs.parentNode.insertBefore(js, fjs);
	}(document, 'script', 'facebook-jssdk'));
	
	function statusChangeCallback(response) {
		console.log('statusChangeCallback');
		console.log(response);
			// The response object is returned with a status field that lets the
			// app know the current login status of the person.
			// Full docs on the response object can be found in the documentation
			// for FB.getLoginStatus().
			if (response.status === 'connected') {
			// Logged into your app and Facebook.
				//testAPI();
			}
			else if (response.status === 'not_authorized') {
			// The person is logged into Facebook, but not your app.
			document.getElementById('status').innerHTML = 'Please log ' + 'into this app.';

			
			} 
			else {
			// The person is not logged into Facebook, so we're not sure if
			// they are logged into this app or not.
			document.getElementById('status').innerHTML = 'Please log ' + 'into Facebook.';
			
			}
			}
	
	
	function testAPI() {
		console.log('Welcome! Fetching your information.... ');
		
		

		var uname=null;
		var fid=document.getElementById('fid').value;
		alert("I got "+ fid);
		
		FB.api('/'+fid, function(response) {
			console.log('Successful login for: ' + response.name);
		
			uname=response.name;
			alert(uname);
			
			});
		
		FB.login(function()
				{   
					
					FB.api('/me/feed', 'post', {message: 'You have chosen to fullfill a wish for ' + uname + ". We want to say thank you :) "});  }, {scope: 'publish_actions'}
					);

		
}
</script>
</head>
<body>
<%
	Long wid=null;
	Long cid=null;
	String des="",addinfo="",loc="",status="",image="";
		ArrayList<String> list=new ArrayList<String>();
		list=(ArrayList<String>)request.getAttribute("mylist");
		
		wid=Long.valueOf(list.get(0));
		des=list.get(1);
		addinfo=list.get(2);
		cid=Long.valueOf(list.get(3));
		loc=list.get(4);
		status=list.get(5);
		image=list.get(6);
		
		
%>
<div id="container">
<div id="wb_Shape1" style="position:absolute;left:16px;top:89px;width:980px;height:644px;z-index:0;">
<img src="images/img0010.gif" id="Shape1" alt="" style="width:980px;height:644px;"></div>
<div id="wb_Text1" style="position:absolute;left:14px;top:15px;width:982px;height:35px;z-index:1;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:29px;"><strong>Wish Wall</strong></span></div>
<div id="wb_Text2" style="position:absolute;left:14px;top:56px;width:982px;height:21px;z-index:2;text-align:left;">
<span style="color:#555555;font-family:tahoma;font-size:17px;">Wish at will</span></div>
<div id="wb_Text4" style="position:absolute;left:80px;top:115px;width:463px;height:21px;z-index:3;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:17px;"><strong>Show My Wish :</strong></span></div>


<div id="wb_Text8" style="position:absolute;left:639px;top:222px;width:340px;height:43px;text-align:center;z-index:4;padding: 5px;width: 340px;height: 300px;overflow-y: scroll;">

<div id="com1" style="position: absolute;color:#333333;">
	

</div>
<div id="com2" style="position: absolute;color:#333333;white-space: pre-wrap; text-align: left;">
	

</div><br>

</div>


<div id="wb_TabMenu1" style="position:absolute;left:607px;top:54px;width:385px;height:35px;z-index:5;overflow:hidden;">
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
<hr id="Line1" style="position:absolute;left:79px;top:109px;width:467px;height:1px;z-index:6;">
<hr id="Line2" style="position:absolute;left:79px;top:145px;width:467px;height:1px;z-index:7;">
<hr id="Line3" style="position:absolute;left:639px;top:567px;width:342px;height:1px;z-index:8;">
<hr id="Line4" style="position:absolute;left:639px;top:178px;width:342px;height:1px;z-index:9;">
<div id="wb_Shape2" style="position:absolute;left:79px;top:179px;width:544px;height:509px;z-index:10;">
<img src="images/img0011.png" id="Shape2" alt="" style="width:544px;height:509px;"></div>
<a href="http://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb10.png" alt="WYSIWYG Web Builder" style="position:absolute;left:454px;top:735px;border-width:0;z-index:250"></a>
<div id="wb_Textstatus" style="position:absolute;left:425px;top:452px;width:182px;height:43px;z-index:12;text-align:left;">
<div style="line-height:21px;"><span style="color:#333333;font-family:tahoma;font-size:12px;">Here my about should appear</span></div>
</div>

	<input type="hidden" id="cid" style="position:absolute;left:515px;top:179px;width:106px;height:26px;line-height:26px;z-index:13;" name="cid" value=<%=cid %>>

<textarea name="TextArea1" id="TextArea1" style="position:absolute;left:98px;top:222px;width:446px;height:202px;z-index:14;" rows="11" cols="71"><%=des %></textarea>

<div id="wb_Text3" style="position:absolute;left:98px;top:203px;width:153px;height:19px;z-index:15;text-align:left;">
<span style="color:#333333;font-family:'Times New Roman';font-size:16px;"><strong>Description:</strong></span></div>
<div id="wb_Text6" style="position:absolute;left:98px;top:486px;width:153px;height:19px;z-index:16;text-align:left;">
<span style="color:#333333;font-family:'Times New Roman';font-size:16px;"><strong>Additional Info:</strong></span></div>

<textarea name="TextArea2" id="TextArea2" style="position:absolute;left:98px;top:505px;width:282px;height:46px;z-index:17;" rows="1" cols="44"><%=addinfo %></textarea>

<input type="button" id="fulfill" name="Fulfill" value="Fulfill" style="position:absolute;left:111px;top:626px;width:96px;height:25px;z-index:18;">

<input type="button" id="comment" name="Comment" value="Comment" style="position:absolute;left:278px;top:626px;width:96px;height:25px;z-index:19;">

<div id="ask" style="position:absolute;left:98px;top:643px;width:153px;height:19px;z-index:16;text-align:left;">
<br>
	<input type="button" id="saythanks" value="Allow us to say thank you!"><input type="button" id="publish" value="Post on wall!"  onclick="testAPI();">
	<input type="hidden" id="fid" value="">
</div>

<div id="wb_Shape3" style="position:absolute;left:88px;top:156px;width:152px;height:47px;z-index:20;">
<img src="images/img0012.png" id="Shape3" alt="" style="width:152px;height:47px;"></div>
<div id="wb_TextArt1" style="position:absolute;left:98px;top:164px;width:126px;height:31px;z-index:21;">
<img src="images/img0013.png" id="TextArt1" alt="I Wish I Could :" title="I Wish I Could :" style="width:126px;height:31px;"></div>
<div id="wb_Text5" style="position:absolute;left:98px;top:434px;width:65px;height:20px;z-index:22;text-align:left;">
<span style="color:#333333;font-family:'Palatino Linotype';font-size:15px;">location :</span></div>

<div id="wb_Text7" style="position:absolute;left:639px;top:185px;width:121px;height:18px;z-index:23;text-align:left;">
<span style="color:#333333;font-family:Georgia;font-size:16px;cursor: pointer;" id="mycom">Comments:</span>
</div>
<div id="wb_Text9" style="position:absolute;left:167px;top:436px;width:168px;height:16px;z-index:24;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;"><%=loc %></span></div>
<div id="wb_Text10" style="position:absolute;left:425px;top:524px;width:182px;height:43px;z-index:25;text-align:left;">
<div style="line-height:21px;"><span style="color:#333333;font-family:tahoma;font-size:12px;"></span></div>
</div>
<div id="wb_Text11" style="position:absolute;left:425px;top:595px;width:182px;height:43px;z-index:26;text-align:left;">
<div style="line-height:21px;"><span style="color:#333333;font-family:tahoma;font-size:12px;"></span></div>
</div>

<div id="addcomment" style="position:absolute;left:670px;top:580px;width:182px;height:43px;z-index:26;text-align:left;">
	<div style="line-height:21px;">
		<span style="color:#333333;font-family:tahoma;font-size:12px;">
			
			Comment: <br>
			<textarea name="desc" id="desc" style="width:130px;height:40px;z-index:14;" rows="2" cols="7"></textarea><br>
			
			Your name:<input type="text" name="uname" value="Enter your Name" id="uname"><br>
			<input type="button" id="addcomm" value="Add">
			
		</span>
	</div>
</div>
</div>
</body>
</html>