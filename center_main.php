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
function CenterLayer1() {
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

<body onselectstart="return false" ondragstart="return false" oncontextmenu="return false" bgcolor="black" text="black" link="#F6FF00" vlink="#F6FF00" alink="#F6FF00" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" OnLoad="HideStatus(); CenterLayer1();">
<form>
    <table cellpadding="0" cellspacing="0" height="700" width="1020">
        <tr>
            <td width="968" height="2">
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
            <td width="974" height="616" background="images/mainimg_03.jpg">
                <p style="line-height:150%;" align="left"></p>
                <div align="right">
                    <p><br>
&nbsp;</p>
                    <table width="751" cellpadding="0" cellspacing="0" height="397">
                        <tr>
                            <td background="images/testbox1.jpg" width="0" height="71">
                                <p style="margin-left:25pt;"><span style="font-size:9pt;"><font color="white"><br>
<img src="images/box_text1_home.jpg" width="500" height="30" border="0"></font></span></p>
                            </td>
                        </tr>
                        <tr>
                            <td background="images/testbox2.jpg" height="114">
                                <p style="line-height:16pt; margin-left:30pt;"><span style="font-size:9pt;"><b><font color="#FFCC00">[공지] 써퓨리온 애드온 2.0.2 정식 버전 출시 예정&nbsp;(2006.07.08)</font></b></span><font color="white"><span style="font-size:9pt;"><br>
<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">먼저 '써퓨리온 애드온 2 베타' </span></font><font color="white"><span style="font-size:9pt; line-height:150%;">버전에 대해 성원을 보내주신 분들께 깊은 감사의 말씀 올립니다.<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;"><br>
그동안 미뤄왔던 정식 버전인 '써퓨리온 애드온 2.0.2' 가 7월달 내에&nbsp;공개될 예정입니다.<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">원래 기말고사 끝나자마자 출시하려고 했으나 갑작스럽게 월드 오브 워크래프트가 1.11 패치를<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">시행하는 바람에 더 늦춰졌으며, 최대한 빠른 시일내에 출시할 수 있도록 노력하고 있습니다.</span></font></p>
                                <p style="line-height:16pt; margin-left:30pt;"><font color="white"><span style="font-size:9pt;">곧 출시되는 정식 버전인 '써퓨리온 애드온 2.0.2' 에 많은 관심을 보여주시길 바랍니다.</span></font><font color="white"><span style="font-size:9pt;"><br>
</span></font><font color="white"><span style="font-size:9pt;">앞으로 많은 이용 부탁드립니다. 감사합니다.<br>
&nbsp;</span></font></p>
                            </td>
                        </tr>
                        <tr>
                            <td background="images/testbox3.jpg" height="30">&nbsp;</td>
                        </tr>
                    </table>
                </div>
                <p>&nbsp;</p>
                <p style="line-height:150%; margin-left:35pt;" align="right"><span style="font-size:9pt;"><img src="images/button_enter1.gif" width="193" height="32" border="0" name="enter" OnMouseOut="enter.src='images/button_enter1.gif';" OnMouseOver="enter.src='images/button_enter2.gif';" onclick="ShowLayer('ErrLayer1')" style="cursor:hand;"></span></p>
                <p align="left"><br>
<br>
<img src="images/main_base.jpg" width="507" height="99" border="0"></p>
                
            </td>
        </tr>
    </table>
</form>
</body>

</html>