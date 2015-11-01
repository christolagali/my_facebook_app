<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Variant Duo v1.0</title>
<meta name="description" content="Your description goes here">
<meta name="keywords" content="your,keywords,goes,here">
<meta name="author" content="Your Name">
<meta name="generator" content="WYSIWYG Web Builder 10 Trial Version - http://www.wysiwygwebbuilder.com">
<link href="../css/variant-duo.css" rel="stylesheet" type="text/css">
<link href="../css/profile.css" rel="stylesheet" type="text/css">
</head>
<body>
<script>

	var loc=null;

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
				testAPI();
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
	
	testAPI();
	function testAPI() {
		console.log('Welcome! Fetching your information.... ');
		
		FB.api('/me',function(res){
		
			
		        /* handle the result */
			/*	alert(res.location.name); */
				loc = res.location.name;
				document.getElementById("Editbox5").value = loc;
			
		});
		
		FB.api('/me', function(response) {
		console.log('Successful login for: ' + response.name);
	
		document.getElementById("Editbox1").value = response.name;
		document.getElementById("Editbox2").value = response.birthday;
		document.getElementById("Editbox3").value = response.last_name;
		document.getElementById("TextArea1").value = response.bio;
	
		
	//	alert(response.name);
		});
		
		FB.api('/me/picture',{
			"redirect": false,
	        "height": "200",
	        "type": "normal",
	        "width": "200"
	    },function(res){
	    	var p=res.data.url;
		//	alert(p);
			document.getElementById("Image1").src=p;
		});
		
		
}
</script>
<div id="container">
<div id="wb_Shape1" style="position:absolute;left:16px;top:81px;width:980px;height:616px;z-index:0;">
<img src="images/img0004.gif" id="Shape1" alt="" style="width:980px;height:616px;"></div>
<div id="wb_Text2" style="position:absolute;left:14px;top:7px;width:982px;height:21px;z-index:1;text-align:left;">
<span style="color:#555555;font-family:tahoma;font-size:17px;">Wish at will</span></div>
<div id="wb_Text9" style="position:absolute;left:14px;top:667px;width:942px;height:14px;text-align:center;z-index:2;">
<span style="color:#333333;font-family:tahoma;font-size:12px;">Useful links: <a href="http://andreasviklund.com/templates/" class="style1">More free website templates</a> | <a href="http://andreasviklund.com/wordpress-themes/" class="style1">Themes for WordPress</a> | <a href="http://andreasviklund.com/templates/variant-Duo/" class="style1">Variant Duo template page</a></span></div>
<div id="wb_Text10" style="position:absolute;left:14px;top:697px;width:982px;height:22px;text-align:right;z-index:3;">
<span style="color:#888888;font-family:tahoma;font-size:9.3px;">Copyright © 2010 <a href="index.html" class="style2">Your Name</a><br>Template design by <a href="http://andreasviklund.com/" class="style2">Andreas Viklund</a></span></div>
<div id="wb_TabMenu1" style="position:absolute;left:287px;top:28px;width:462px;height:35px;z-index:4;overflow:hidden;">
<ul id="TabMenu1">
<li><a class="active" href="#">Profile</a></li>
<li>
	<form action="/MyRoute?act=showwall" method="post">
		<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="Wishwall" id="Wishwall" value="Wishwall"></a>
	</form>
</li>
<li>
	<form action="/MyRoute?act=mywish" method="post">
		<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="mywish" id="profile" value="MyWishes"></a>
	</form>
</li>
<li>
		<form action="/MyRoute?act=exit" method="post">
			<a><input type="submit" style="font-family: Arial;font-size: 16px;font-weight: bold;border-color: transparent;background-color: transparent;cursor:pointer;" name="Exit" id="Exit" value="Exit"></a>
		</form>
</li>
</ul>
</div>
<a href="http://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb10.png" alt="WYSIWYG Web Builder" style="position:absolute;left:454px;top:735px;border-width:0;z-index:250"></a>
<div id="wb_Image1" style="position:absolute;left:77px;top:135px;width:150px;height:150px;z-index:6;">
<img src="images/993023_10201228702871491_1440665526_n.jpg" id="Image1" alt=""></div>
<div id="wb_Text1" style="position:absolute;left:296px;top:180px;width:84px;height:16px;z-index:7;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Name :</span></div>
<input type="text" id="Editbox1" style="position:absolute;left:380px;top:180px;width:200px;height:18px;line-height:18px;z-index:8;" name="myname" value="">
<div id="wb_Text3" style="position:absolute;left:296px;top:243px;width:84px;height:16px;z-index:9;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Birthday :</span></div>
<input type="text" id="Editbox2" style="position:absolute;left:380px;top:243px;width:200px;height:18px;line-height:18px;z-index:10;" name="mybday" value="">
<div id="wb_Text4" style="position:absolute;left:127px;top:338px;width:84px;height:16px;z-index:11;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Profession :</span></div>
<input type="text" id="Editbox3" style="position:absolute;left:211px;top:338px;width:455px;height:18px;line-height:18px;z-index:12;" name="myprof" value="">
<div id="wb_Text5" style="position:absolute;left:127px;top:390px;width:84px;height:16px;z-index:13;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Skills :</span></div>
<div id="wb_Text6" style="position:absolute;left:127px;top:514px;width:84px;height:16px;z-index:14;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Location :</span></div>
<input type="text" id="Editbox5" style="position:absolute;left:211px;top:514px;width:455px;height:18px;line-height:18px;z-index:15;" name="myloc" value="">
<div id="wb_Text7" style="position:absolute;left:127px;top:575px;width:84px;height:16px;z-index:16;text-align:left;">
<span style="color:#333333;font-family:Arial;font-size:13px;">Hobbies :</span></div>
<textarea name="myskill" id="TextArea1" style="position:absolute;left:212px;top:390px;width:328px;height:70px;z-index:17;" rows="3" cols="51"></textarea>
<textarea name="myhob" id="TextArea2" style="position:absolute;left:212px;top:575px;width:328px;height:70px;z-index:18;" rows="3" cols="51"></textarea>
</div>
</body>
</html>