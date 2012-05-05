<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<%@page import="java.util.List"%>
<%@page import="com.seis.dao.impl.RessourceDaoImpl"%>
<%@page import="com.seis.domain.Ressource"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script type="text/javascript">
  /*  
   * creates a new XMLHttpRequest object which is the backbone of AJAX,  
   * or returns false if the browser doesn't support it  
   */ 

  function getXMLHttpRequest() {  
	   alert("getXMLHttpRequest called");
    var xmlHttpReq = false;  
    // to create XMLHttpRequest object in non-Microsoft browsers  
    if (window.XMLHttpRequest) {        	  
      xmlHttpReq = new XMLHttpRequest();             
    } else if (window.ActiveXObject) {  
      try {  
        // to create XMLHttpRequest object in later versions  
        // of Internet Explorer  
        xmlHttpReq = new ActiveXObject("Msxml2.XMLHTTP");  
      } catch (exp1) {  
        try {  
          // to create XMLHttpRequest object in older versions  
          // of Internet Explorer  
          xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");  
        } catch (exp2) {  
          xmlHttpReq = false;  
        }  
      }  
    }  
    return xmlHttpReq;  
  }  
 
  function performAjaxFileUpload() {
		alert("Upload.jsp:performAjaxFileUpload");
  //   var sampleText = document.getElementById("sampleText").value;
		var sourcFile = document.getElementById("u29").files[0];
		var formdata = new FormData();
		formdata.append("sampleFile", sourcFile);	        		
		
		var xmlHttpRequest = getXMLHttpRequest(); 
		xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);  
	
		xmlHttpRequest.open("POST","servlet/FileUploadServlet", true);
		xmlHttpRequest.send(formdata);
		
		xmlHttpRequest.onload = function(e) {
			if (this.status == 200) {
			   alert(this.responseText);
			}
		};	        		
}
  
 function performAjaxSubmit() {
 		alert("Upload.jsp:performAjaxSubmit");
    //   var sampleText = document.getElementById("sampleText").value;
 		var sourcFile = document.getElementById("u29").files[0];
 		var formdata = new FormData();
 		formdata.append("sampleFile", sourcFile);	        		
 		
 		var xmlHttpRequest = getXMLHttpRequest(); 
 		xmlHttpRequest.onreadystatechange = getReadyStateHandler(xmlHttpRequest);  
	
 		xmlHttpRequest.open("POST","servlet/FileUploadServlet", true);
 		xmlHttpRequest.send(formdata);
 		
 		xmlHttpRequest.onload = function(e) {
 			if (this.status == 200) {
 			   alert(this.responseText);
 			}
  		};	        		
 }
 /*  
  * Returns a function that waits for the state change in XMLHttpRequest  
  */ 

 function getReadyStateHandler(xmlHttpRequest) {  
   // an anonymous function returned  
   // it listens to the XMLHttpRequest instance  

   return function() {  
     if (xmlHttpRequest.readyState == 4) {  
       if (xmlHttpRequest.status == 200) {  
    	   alert("200");
//    	   document.getElementById("u29").value="";
         document.getElementById("result").innerHTML = xmlHttpRequest.responseText;  
      } else {  
         alert("HTTP error " + xmlHttpRequest.status + ": " + xmlHttpRequest.statusText);  
      }  
     }  
  };  
}         	
</script>	
<title></title>
<link rel="stylesheet" href="css/reset.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css" media="screen">
<link rel="stylesheet" href="css/layout.css" type="text/css" media="screen">
<script type="text/javascript" src="js/jquery-1.6.min.js"></script>
<script src="js/cufon-yui.js" type="text/javascript"></script>
<script src="js/cufon-replace.js" type="text/javascript"></script>
<script src="js/Open_Sans_400.font.js" type="text/javascript"></script>
<script src="js/Open_Sans_Light_300.font.js" type="text/javascript"></script> 
<script src="js/Open_Sans_Semibold_600.font.js" type="text/javascript"></script>  
<script type="text/javascript" src="js/tms-0.3.js"></script>
<script type="text/javascript" src="js/tms_presets.js"></script> 
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script> 
<script src="js/FF-cash.js" type="text/javascript"></script>

<title>Upload Resource</title>
<script>	
	

	$(function() {
		$("#uploadbtn").click(function() { 					  						
			alert('Upload Button');
			return false;			
		});				  
	});
</script>
</head>
<body>
Contributor's Email Address
<c:out value="${sessionScope.email}"/>
	<div class="main">	
		
		<div class="row-1">
			<H1><a class="logo" href="index.jsp">Teacher Resources</a></H1>			
		</div>
		
<INPUT id=u18  type=text value="mmkhtitle" style="position:absolute; left:342px; top:265px; width:308px; height:25px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none"   >

<DIV id=u19 style="position:absolute; left:202px; top:272px; width:130px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u19_rtf><span style=" font-family:'Arial'; color:#FF0000; font-size:13px;">*</span><span style=" font-family:'Arial'; color:#000000; font-size:13px;"> Title</span></DIV></DIV>
<DIV id=u20 style="position:absolute; left:169px; top:190px; width:211px; height:22px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u20_rtf><span style=" color:#000099; font-size:19px;"><b>Upload Resource</b></span></DIV></DIV>

<!--  mike start -->
<SELECT id=u21  style="position:absolute; left:342px; top:310px; width:180px; height:22px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none" >
<OPTION  value="behavioral Studies">behavioral Studies</OPTION>
<OPTION  value="Career Education">Career Education</OPTION>
<OPTION  value="Civics">Civics</OPTION>
<OPTION  value="Economics">Economics</OPTION>
<OPTION  value="English">English</OPTION>
<OPTION  value="Foreign Language">Foreign Language</OPTION>
<OPTION  value="Geography">Geography</OPTION>
<OPTION  value="Health">Health</OPTION>
<OPTION  value="Historical Understanding">Historical Understanding</OPTION>
<OPTION  value="K-4 History and State History">K-4 History and State History</OPTION>
<OPTION  value="Math">Math</OPTION>
<OPTION  value="Physical Education">Physical Education</OPTION>
<OPTION  value="Science">Science</OPTION>
<OPTION  value="Social Studies">Social Studies</OPTION>
<OPTION  value="Technology">Technology</OPTION>
<OPTION  value="The Arts">The Arts</OPTION>
<OPTION  value="U.S History">U.S History</OPTION>
<OPTION  value="World History">World History</OPTION>
</SELECT>

<DIV id=u22 style="position:absolute; left:201px; top:313px; width:130px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u22_rtf><span style=" font-family:'Arial'; color:#FF0000; font-size:13px;">*</span><span style=" font-family:'Arial'; color:#000000; font-size:13px;"> Subject</span></DIV></DIV>
<DIV id=u23 style="position:absolute; left:201px; top:360px; width:130px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u23_rtf><span style=" font-family:'Arial'; color:#FF0000; font-size:13px;">*</span><span style=" font-family:'Arial'; color:#000000; font-size:13px;"> Grade Level</span></DIV></DIV>
<DIV id=u24 style="position:absolute; left:200px; top:420px; width:130px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u24_rtf><span style=" font-family:'Arial'; color:#FF0000; font-size:13px;">*</span><span style=" font-family:'Arial'; color:#000000; font-size:13px;"> Description</span></DIV></DIV>
<TEXTAREA id=u25  style="position:absolute; left:345px; top:430px; width:314px; height:92px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none"  ></TEXTAREA>

<SELECT id=u26  style="position:absolute; left:345px; top:366px; width:180px; height:22px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none" >
<OPTION  value="Pre-K">Pre-K</OPTION>
<OPTION  value="K">K</OPTION>
<OPTION  value="1">1</OPTION>
<OPTION  value="2">2</OPTION>
<OPTION  value="3">3</OPTION>
<OPTION  value="4">4</OPTION>
<OPTION  value="5">5</OPTION>
<OPTION  value="6">6</OPTION>
<OPTION  value="7">7</OPTION>
<OPTION  value="8">8</OPTION>
<OPTION  value="9">9</OPTION>
<OPTION  value="10">10</OPTION>
<OPTION  value="11">11</OPTION>
<OPTION  value="12">12</OPTION>
</SELECT>

<DIV id=u27 style="position:absolute; left:200px; top:554px; width:130px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u27_rtf><span style=" font-family:'Arial'; color:#FF0000; font-size:13px;">*</span><span style=" font-family:'Arial'; color:#000000; font-size:13px;"> Picture/Thumbnail</span></DIV></DIV>
<!-- 
<INPUT id=u28  type=text value="" style="position:absolute; left:342px; top:548px; width:428px; height:25px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none"   >


<INPUT id=u29  type=file value="Browse" size=60 style="position:absolute; left:342px; top:547px; width:500px; height:25px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none" >
 -->
<iframe id="uploadFrameID" name="uploadFrame" height="0" width="0" frameborder="0" scrolling="yes"></iframe>              
<form id="uploadFileForm" enctype="multipart/form-data" method="post" >
<INPUT id=u29  type=file value="Browse" size=60 style="position:absolute; left:342px; top:547px; width:500px; height:25px; ; ; text-align: left ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none" >

<INPUT id=u30  type="button" value="Add Content" onClick="performAjaxFileUpload();" style="position:absolute; left:842px; top:547px; width:80px; height:25px; ; ; text-align: center ; font-family:'Arial'; font-size: 13px; color:#000000; font-style:normal; font-weight:normal; text-decoration:none" >
</form> 

<script type="text/javascript">
    var rJsonu32 = {};
</script>

<DIV id=ru31 style="position:absolute; left:470px; top:594px; width:211px; height:41px;; overflow:visible; visibility:hidden">

<span style="position:absolute; left:-3px; top:-3px; width:219px; height:49px; ;
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='Upload_files/ru31.png',sizingMethod='scale');
"><img style="width:219px; height:49px; filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);" 
src="Upload_files/ru31.png" border="0" alt=""></span>

</DIV>
<DIV id=ou31 style="position:absolute; left:470px; top:594px; width:211px; height:41px;; overflow:visible; ">

<span style="position:absolute; left:-3px; top:-3px; width:219px; height:49px; ;
filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='Upload_files/u31.png',sizingMethod='scale');
"><img style="width:219px; height:49px; filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0);" 
src="Upload_files/u31.png" border="0" alt=""></span>

</DIV>
<DIV id=u31container style="position:absolute; left:470px; top:594px; width:211px; height:41px;; overflow:visible;">

<DIV id=u32 style="position:absolute; left:2px; top:9px; width:206px; height:22px; ; ; text-align: center ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u32_rtf><div style="text-align:center"><span style=" color:#000000; font-size:19px;"><b>Submit</b></span></div></DIV></DIV>
</DIV>
<!-- 
<INPUT type="image" id=u31 src="Resources/transparent.gif" style="position:absolute; left:470px; top:680px; width:210px; height:40px" onmouseover="ApplyImageAndTextStyles('r', 'u31', 'u32', rJsonu32, false);" onmouseout="ApplyImageAndTextStyles('o', 'u31', 'u32', '', false);"  >
 -->
<INPUT type="image" id=u31 src="Resources/transparent.gif" style="position:absolute; left:470px; top:594px; width:210px; height:40px" onmouseover="ApplyImageAndTextStyles('r', 'u31', 'u32', rJsonu32, false);" onmouseout="ApplyImageAndTextStyles('o', 'u31', 'u32', '', false);"  onClick="performAjaxSubmit();">

<DIV id=u33 style="position:absolute; left:340px; top:594px; width:118px; height:16px; ; ; text-align: left ; font-family:Arial; text-align:left; word-wrap:break-word;" >
<DIV id=u33_rtf><a href="index.jsp"><span style=" color:#3366CC; font-size:13px;"><u>&lt;&lt; Back Home</u></span></a></DIV></DIV><SCRIPT src="Resources/axurerp_pagescript.js"></SCRIPT>
</div>

	<div style="width:100%;overflow:hidden;padding-top:500px;text-align:center">
	 	&copy;&nbsp;2012&nbsp;&#45;&nbsp;University&nbsp;of&nbsp;St.&nbsp;Thomas&nbsp;-&nbsp;SEIS&nbsp;752&nbsp;Team&nbsp;I
	</div>	
<!--  mike end -->

		
	
</body>
</html>