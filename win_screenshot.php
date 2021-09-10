<html>
<head>

<script language="JavaScript"> 

// 상태표시줄에 메시지 보여주기
function HideStatus(){ 
window.status='블리자드 스케일! 월드 오브 워크래프트의 써퓨리온 미니 홈페이지입니다.' 
return true 
} 

// 상태표시줄에 링크 숨겨주기
if (document.layers) 
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT) 
document.onmouseover=HideStatus
document.onmouseout=HideStatus 
document.onmouseup=HideStatus
document.onmousedown=HideStatus
document.onfocus=HideStatus
document.onclick=HideStatus
document.onload=HideStatus

// 링크에 테두리 없애기
function bluring(){
if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
}
document.onfocusin=bluring;

// 레이어를 중앙에 맞추기
function CenterLayer(name) {
document.all[name].style.setExpression("left", "document.body.clientWidth/2 - ErrLayer1.offsetWidth/2");
document.all[name].style.setExpression("top", "document.body.clientHeight/2 - ErrLayer1.offsetHeight/2");
}

// 레이어를 보여주기
function ShowLayer(name) {
document.all[name].style.visibility = "visible";
}

// 레이어를 숨겨주기
function HideLayer(name) {
document.all[name].style.visibility = "hidden";
}

// 레이어를 이동시키기
function MoveLayer(name) {
oElement = document.elementFromPoint(event.x, event.y);
document.all[name].style.pixelLeft=event.x+10;
document.all[name].style.pixelTop=event.y+1;
}

// 전체 화면으로 전환하기
function maximizeWindow() {
if (parseInt(navigator.appVersion)>3) {
  if (navigator.appName=="Netscape") {
   if (top.screenX>0 || top.screenY>0) top.moveTo(0,0);
   if (top.outerWidth < screen.availWidth)
      top.outerWidth=screen.availWidth;
   if (top.outerHeight < screen.availHeight) 
      top.outerHeight=screen.availHeight;
  }
  else {
   top.moveTo(-4,-4);
   top.resizeTo(screen.availWidth+8,screen.availHeight+8);
  }
}
}
</script> 

<title>와우 써퓨리온 미니 홈페이지</title>

<!-- 인터넷 캐시 사용하지 않기 -->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<!-- 이미지 도구모음 사용하지 않기 -->
<meta http-equiv=imagetoolbar content=no>

</head>


<body onload="maximizeWindow();" onselectstart="return false" ondragstart="return false" oncontextmenu="return false" bgcolor="black" text="black" link="white" vlink="white" alink="white" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" scroll="auto">
                    <div id="TooltipLayer" style="background-color:black; padding:5pt; border-width:1pt; border-color:rgb(117,117,117); border-style:double; width:233px; height:136px; position:absolute; left:154px; top:106px; z-index:2; visibility:hidden; filter:alpha(opacity=80);">
                        <p style="line-height:16pt;"><font color="white"><span style="font-size:9pt;"><b>스크린 샷 창 닫기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그림<br>
<br>
</b></span></font><span style="font-size:9pt;"><font color="white">써퓨리온 애드온 2.0의 스크린 샷을 크게 보는&nbsp;창입니다.</font><font color="#66FF00"><br>
사용효과: 스크린 샷 창을 닫을 수 있습니다.</font></span></p></div>
<a href="javascript:window.close();"><img src="http://www.vista2006.zc.bz/worldofwarcraft/<?=$src?>" border="0" vspace="0" hspace="0" onmouseover="ShowLayer('TooltipLayer')" onmouseout="HideLayer('TooltipLayer')" onmousemove="MoveLayer('TooltipLayer')">
</a></body>

</html>