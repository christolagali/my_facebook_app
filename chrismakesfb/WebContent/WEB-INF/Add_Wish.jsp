<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add a Wish</title>
<meta name="description" content="Your description goes here">
<meta name="keywords" content="your,keywords,goes,here">
<meta name="author" content="Your Name">
<meta name="generator" content="WYSIWYG Web Builder 10 Trial Version - http://www.wysiwygwebbuilder.com">
<link href="../css/variant-duo.css" rel="stylesheet" type="text/css">
<link href="../css/Add_Wish.css" rel="stylesheet" type="text/css">
<script src="../js/jquery-1.9.1.js"></script>
<script type="text/javascript">

	
	start();
	function start()
	{
	
		
			var param={act:"addnewwish"};
			 $.ajax({  
                 url:'Myops',  
                 type:'post',
                 dataType: 'json',
                 data:param,  
                 success: function(data) {  
                	      
                	
                	 $("#cid").val(data.wid);
                	 $("#uid").val(data.uid);
                	 
                 }  
             }); 
	}
</script>
</head>

<body>


<form action="Myops?act=put" method="post">

<div id="container">
<div id="wb_Shape1" style="position:absolute;left:12px;top:89px;width:980px;height:644px;z-index:0;">
<img src="images/img0006.gif" id="Shape1" alt="" style="width:980px;height:644px;"></div>
<div id="wb_Text1" style="position:absolute;left:14px;top:15px;width:982px;height:35px;z-index:1;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:29px;"><strong>Wish Wall</strong></span></div>
<div id="wb_Text2" style="position:absolute;left:14px;top:56px;width:982px;height:21px;z-index:2;text-align:left;">
<span style="color:#555555;font-family:tahoma;font-size:17px;">Wish at will</span></div>
<div id="wb_Text4" style="position:absolute;left:80px;top:115px;width:463px;height:21px;z-index:3;text-align:left;">
<span style="color:#2A7A9A;font-family:tahoma;font-size:17px;"><strong>Creating one from Scratch :</strong></span></div>
<div id="wb_Text8" style="position:absolute;left:626px;top:461px;width:342px;height:43px;z-index:4;text-align:left;">
<div style="line-height:21px;"><span style="color:#333333;font-family:tahoma;font-size:12px;">Here I should try putting friends updates</span></div>
</div>
<div id="wb_TabMenu1" style="position:absolute;left:608px;top:56px;width:385px;height:35px;z-index:5;overflow:hidden;">
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
<hr id="Line1" style="position:absolute;left:79px;top:109px;width:467px;height:1px;z-index:6;">
<hr id="Line2" style="position:absolute;left:79px;top:145px;width:467px;height:1px;z-index:7;">
<hr id="Line3" style="position:absolute;left:626px;top:666px;width:342px;height:1px;z-index:8;">
<hr id="Line4" style="position:absolute;left:626px;top:446px;width:342px;height:1px;z-index:9;">
<div id="wb_Shape2" style="position:absolute;left:79px;top:179px;width:544px;height:509px;z-index:10;">
<img src="images/img0007.png" id="Shape2" alt="" style="width:544px;height:509px;"></div>
<a href="http://www.wysiwygwebbuilder.com" target="_blank"><img src="images/builtwithwwb10.png" alt="WYSIWYG Web Builder" style="position:absolute;left:454px;top:735px;border-width:0;z-index:250"></a>
<div id="wb_Textstatus" style="position:absolute;left:430px;top:608px;width:182px;height:43px;z-index:12;text-align:left;">
<div style="line-height:21px;"><span style="color:#333333;font-family:tahoma;font-size:12px;">Here my about should appear</span></div>
</div>

<input type="hidden" id="cid" style="position:absolute;left:504px;top:195px;width:106px;height:26px;line-height:26px;z-index:13;" name="cid" value="">

<input type="hidden" id="uid" style="position:absolute;left:262px;top:195px;width:83px;height:26px;line-height:26px;z-index:14;" name="uid" value="">

<input type="hidden" id="status" style="position:absolute;left:370px;top:195px;width:105px;height:26px;line-height:26px;z-index:15;" name="status" value="on">

<textarea name="desc" id="desc" style="position:absolute;left:98px;top:242px;width:432px;height:232px;z-index:16;" rows="13" cols="69"></textarea>

<div id="wb_Text3" style="position:absolute;left:98px;top:223px;width:153px;height:19px;z-index:17;text-align:left;">
<span style="color:#333333;font-family:'Times New Roman';font-size:16px;"><strong>Description:</strong>
</span>
</div>
<div id="wb_Text6" style="position:absolute;left:98px;top:503px;width:153px;height:19px;z-index:18;text-align:left;">
<span style="color:#333333;font-family:'Times New Roman';font-size:16px;"><strong>Additional Info:</strong>
</span>
</div>
<textarea name="addinfo" id="addinfo" style="position:absolute;left:98px;top:522px;width:282px;height:46px;z-index:19;" rows="1" cols="44">
</textarea>

<input type="file" id="FileUpload1" style="position:absolute;left:98px;top:591px;width:282px;height:23px;line-height:23px;z-index:20;" name="FileUpload1">
<input type="submit" id="save" name="Save" value="Save" style="position:absolute;left:98px;top:639px;width:96px;height:25px;z-index:21;">
<input type="button" id="exit" name="Exit" value="Exit" style="position:absolute;left:286px;top:639px;width:96px;height:25px;z-index:22;">

<div id="wb_Shape3" style="position:absolute;left:88px;top:156px;width:152px;height:47px;z-index:23;">
	<img src="images/img0008.png" id="Shape3" alt="" style="width:152px;height:47px;">
</div>
<div id="wb_TextArt1" style="position:absolute;left:98px;top:164px;width:126px;height:31px;z-index:24;">
	<img src="images/img0009.png" id="TextArt1" alt="I Wish I Could :" title="I Wish I Could :" style="width:126px;height:31px;">
</div>
</div>
</form>
</body>
</html>