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
function CenterLayer() {
document.all.ErrLayer1.style.setExpression("left", "document.body.clientWidth/2 - ErrLayer1.offsetWidth/2");
document.all.ErrLayer1.style.setExpression("top", "document.body.clientHeight/2 - ErrLayer1.offsetHeight/2");
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

</script> 

<title>와우 써퓨리온 미니 홈페이지</title>

<!-- 인터넷 캐시 사용하지 않기 -->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<!-- 이미지 도구모음 사용하지 않기 -->
<meta http-equiv=imagetoolbar content=no>

</head>

<body onselectstart="return false" ondragstart="return false" oncontextmenu="return false" bgcolor="black" text="black" link="#F6FF00" vlink="#F6FF00" alink="#F6FF00" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" OnLoad="HideStatus(); CenterLayer();">
<form>

<div align="left">
<table cellpadding="0" cellspacing="0" height="818" width="1020">
        <tr>
            <td width="968" height="10">
                    <div id="TooltipLayer1" style="background-color:black; padding:5pt; border-width:1pt; border-color:rgb(117,117,117); border-style:double; width:233px; height:136px; position:absolute; left:154px; top:106px; z-index:2; visibility:hidden; filter:alpha(opacity=80);">
                        <p style="line-height:16pt;"><font color="white"><span style="font-size:9pt;"><b>스크린 샷 크게 보기 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;그림<br>
<br>
</b></span></font><span style="font-size:9pt;"><font color="white">써퓨리온 애드온 2.0의 전반적인 인터페이스 스크린 샷입니다.</font><font color="#66FF00"><br>
사용효과: 스크린 샷 그림을 크게 볼 수 있습니다.</font></span></p></div>
                <div id="ErrLayer1" style="background-image:url('images/errbox1.jpg'); width:600px; height:137px; position:absolute; z-index:1; visibility:hidden; filter:alpha(opacity=90);">
                    <p align="left"><span style="font-size:9pt;"><br>
<br>
<br>
<br>
&nbsp;</span></p>
                    <p align="center"><span style="font-size:9pt;"><a href="javascript:HideLayer('ErrLayer1')"><img src="images/button_ok1.gif" width="193" height="32" border="0" name="ok" OnMouseOut="ok.src='images/button_ok1.gif';" OnMouseOver="ok.src='images/button_ok2.gif';"></a></span></p>
                </div>
</td>
        </tr>
            <tr>
                <td width="974" height="680">
                    <p align="center"><span style="font-size:9pt;"><img src="images/main_title.jpg" width="600" height="137" border="0">&nbsp;</span></p>
                    <p align="center">&nbsp;</p>
                    <p style="line-height:150%;" align="left"></p>
                    <table width="751" align="center" cellpadding="0" cellspacing="0" height="224">
                        <tr>
                            <td background="images/testbox1.jpg" height="80">
                                <p style="margin-left:25pt;"><span style="font-size:9pt;"><font color="white"><br>
<img src="images/box_text1_addon.jpg" width="500" height="30" border="0"></font></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td background="images/testbox2.jpg" height="114">
                                <p style="line-height:150%; margin-left:30pt;"><font color="white"><span style="font-size:9pt;"><br>
</span></font></p>
                                <p style="line-height:150%; margin-left:30pt;"><span style="font-size:9pt;"><b><font color="yellow">1. </font></b><font color="yellow"><b>심플하고 고급스럽고 유용한 정보를 주는&nbsp;인터페이스 제공<br>
<br>
</b></font></span><font color="white"><span style="font-size:9pt;">더욱 새로워진<b>「써퓨리온 애드온 2」</b>는 싫증이 나는 블리자드&nbsp;기본 인터페이스에서<br>
벗어나 </span></font><span style="font-size:9pt;"><font color="white"><u>심플하고 고급스럽고 유용한 정보를 주는 등의&nbsp;인터페이스를 제공</u></font></span><font color="white"><span style="font-size:9pt;">합니다.</span></font></p>
                                <p style="line-height:150%; margin-left:30pt;"><a href="#" onclick="javascript:window.open('win_screenshot.php?src=/images/addonimg/interface_1.jpg','ScreenShot','top=80,left=0,width=800,height=600,menubar=0,resizable=0,scrollbars=0,status=0,titlebar=0,toolbar=0');"><img src="images/addonimg/interface_1.jpg" width="250" height="200" border="0" onmouseover="ShowLayer('TooltipLayer1')" onmouseout="HideLayer('TooltipLayer1')" onmousemove="MoveLayer('TooltipLayer1')"></a> &nbsp;&nbsp;&nbsp;&nbsp;<a
href="#" onclick="javascript:window.open('win_screenshot.php?src=/images/addonimg/interface_2.jpg','ScreenShot','top=80,left=0,width=800,height=600,menubar=0,resizable=0,scrollbars=0,status=0,titlebar=0,toolbar=0');"><img src="images/addonimg/interface_2.jpg" width="250" height="200" border="0" onmouseover="ShowLayer('TooltipLayer1')" onmouseout="HideLayer('TooltipLayer1')" onmousemove="MoveLayer('TooltipLayer1')"></a></p>
                                <p style="line-height:150%; margin-left:30pt;" align="center">&nbsp;</p>
                                <p style="line-height:150%; margin-left:30pt;" align="center"><b><a href='javascript:alert("써퓨리온 애드온 2 베타버전은 현재 클라리언트에 올바르게 동작하지 않습니다. \n\n나중에 정식버전이 출시되면 그 때 이용하시기 바랍니다. 죄송합니다. ");' target="_self"><span style="font-size:9pt;"><font color="white">[써퓨리온 애드온 2 베타 버전 다운로드]</font></span></a></b></p>
                                <p style="margin-left:30pt;">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td background="images/testbox3.jpg" height="30">&nbsp;</td>
                        </tr>
                    </table>
                    <p>&nbsp;</p>
                    <p align="center"><span style="font-size:9pt;"><img src="images/button_ok1.gif" width="193" height="32" border="0" name="ok2" OnMouseOut="ok2.src='images/button_ok1.gif';" OnMouseOver="ok2.src='images/button_ok2.gif';" onclick="ShowLayer('ErrLayer1')" style="cursor:hand;"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:9pt;"><a href="center_main.php"><img src="images/button_cencel1.gif"
width="193" height="32" border="0" name="cencel" OnMouseOut="cencel.src='images/button_cencel1.gif';" OnMouseOver="cencel.src='images/button_cencel2.gif';"></a></span></p>
                    <p align="left">&nbsp;</p>
                    <p align="left">&nbsp;</p>
                
                </td>
            </tr>
        <tr>
            <td height="115" width="968">
                <p align="center"><img src="images/main_base.jpg" width="530" height="110" border="0"><br>
&nbsp;</p>
            </td>
        </tr>
</table>
</div>
</form>
</body>

</html>