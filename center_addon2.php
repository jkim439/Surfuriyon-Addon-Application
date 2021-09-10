<html>

<head>

<script language="JavaScript"> 

function bluring(){
if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
}
document.onfocusin=bluring;

function fnInit1() {
ErrLayer1.style.setExpression("left", "document.body.clientWidth/2 - ErrLayer1.offsetWidth/2");
ErrLayer1.style.setExpression("top", "document.body.clientHeight/2 - ErrLayer1.offsetHeight/2");
}

alert("반드시 설치방법대로 하셔야 올바르게 작동됩니다. \n\n설치방법대로 따라 하시지 않아 생기는 문제는 모두 본인의 책임입니다. ");

<!--
function showLayer(name) {
document.all[name].style.visibility = "visible";
}
function hideLayer(name) {
document.all[name].style.visibility = "hidden";
}

//-->

<!-- 
function hidestatus(){ 
window.status='블리자드 스케일! 월드 오브 워크래프트의 써퓨리온 미니 홈페이지입니다.' 
return true 
} 

if (document.layers) 
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT) 

document.onmouseover=hidestatus 
document.onmouseout=hidestatus 
document.onmouseup=hidestatus 
document.onmousedown=hidestatus 
document.onfocus=hidestatus 
document.onclick=hidestatus 
document.onload=hidestatus 
//--> 

</script> 

<title>와우 써퓨리온 미니 홈페이지</title>

<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">
</head>

<body onselectstart="return false" ondragstart="return false" oncontextmenu="return false" bgcolor="black" text="black" link="#F6FF00" vlink="#F6FF00" alink="#F6FF00" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" OnLoad="hidestatus(); fnInit1();">
<form>
<div align="left">
<table cellpadding="0" cellspacing="0" height="818" width="1020">
        <tr>
            <td width="968" height="10">
                <div id="ErrLayer1" style="background-image:url('images/errbox1.jpg'); width:600px; height:137px; position:absolute; z-index:1; visibility:hidden;">
                    <p align="left"><span style="font-size:9pt;"><br>
<br>
<br>
<br>
&nbsp;</span></p>
                    <p align="center"><span style="font-size:9pt;"><a href="javascript:hideLayer('ErrLayer1')"><img src="images/button_ok1.gif" width="193" height="32" border="0" name="ok" OnMouseOut="ok.src='images/button_ok1.gif';" OnMouseOver="ok.src='images/button_ok2.gif';"></a></span></p>
                </div>
                <p align="center"><span style="font-size:9pt;">&nbsp;</span></p>
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
                                <table width="566" align="center" cellpadding="0" cellspacing="0" height="228">
                                    <tr>
                                        <td width="566" background="images/msgbox1.jpg" height="36"><span style="font-size:9pt;"><font color="#663300"><b><b><b><b><b><b><b>&nbsp;</b></b></b></b></b></b></b></font></span></td>
                                    </tr>
                                    <tr>
                                        <td width="566" background="images/msgbox2.jpg" height="147">
                                            <table width="100%" height="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="117">
                                                        <p><span style="font-size:9pt;"><font color="#663300">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="images/warning.jpg" width="64" height="65" border="0"><b></b></font></span></p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                        <p>&nbsp;</p>
                                                    </td>
                                                    <td width="449">
                                                        <p style="line-height:150%;"><span style="font-size:9pt;"><b><font color="#CC0000"><br>
본 애드온은 베타 테스트용 버전입니다.<br>
게임 중에 버그나 오류가 발견되어도 책임은 본인에게 있습니다.</font></b></span></p>
                                                        <p style="line-height:150%;"><span style="font-size:9pt;"><font color="#663300"><b>본 애드온 설치시 다음과 같이 변경됩니다.</b><br>
본 프로그램 설치시 <u>게임 해상도가 1280 X 1024 로 변경됩니다.<br>
본 애드온은 </u></font><u><font color="red">1280 X 1024 해상도에서만 동작</font></u><font color="#663300">하니 참조하시기 바라며,<br>
다른 해상도에서는 사용이 불가능합니다.</font></span></p>
                                                        <p style="line-height:150%;"><span style="font-size:9pt;"><b><u><font color="red">[경고] 아래 설치방법 대로 하셔야 올바르게 동작합니다.</font></u></b><font color="#663300"><br>
1. 애드온 파일을 다운로드 받으신 후 설치합니다.<br>
2. 월드 오브 워크래프트 폴더에서 WTF 폴더의 </font></span><font color="#663300"><span style="font-size:9pt;">Account 폴더로 들어갑니다.<br>
</span></font><font color="#663300"><span style="font-size:9pt;">3. &quot;계정 이름&quot; 이라고 되어 있는 폴더 이름을 자신의 ID로 변경합니다.<br>
4. 그&nbsp;폴더에 있는 </span></font><font color="#663300"><span style="font-size:9pt;">&quot;서버 이름&quot; 이라고 되어 있는 폴더 이름을<br>
 &nbsp;&nbsp;&nbsp;&nbsp;자신의 서버로 변경합니다.<br>
</span></font><font color="#663300"><span style="font-size:9pt;">5. 그 폴더 있는 &quot;캐릭터 이름&quot; 이라고 되어 있는 폴더 이름을<br>
 &nbsp;&nbsp;&nbsp;&nbsp;자신의 캐릭터 이름으로 변경합니다.<br>
</span></font><font color="#663300"><span style="font-size:9pt;">6. 이제 월드 오브 워크래프트를 실행하면 설치가 완료됩니다.</span></font></p>
                                                        <p style="line-height:150%;"><span style="font-size:9pt;"><font color="#663300"><b>본 애드온 삭제하는 방법입니다.<br>
</b>1. 월드 오브 워크래프트 폴더에서 WTF 폴더와 </font></span><span style="font-size:9pt;"><font color="#663300">Interface 폴더를 삭제합니다.<br>
</font></span><span style="font-size:9pt;"><font color="#663300">2. 그러면 애드온을 성공적으로 삭제한 것입니다.<br>
</font></span><font color="#663300"><span style="font-size:9pt;"><b></b></span></font></p>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td width="566" background="images/msgbox3.jpg" height="45"><span style="font-size:9pt;"><font color="#663300"><b><b><b><b><b><b><b>&nbsp;</b></b></b></b></b></b></b></font></span></td>
                                    </tr>
                                </table>
                                <p style="margin-left:30pt;">&nbsp;</p>
                            </td>
                        </tr>
                        <tr>
                            <td background="images/testbox3.jpg" height="30">&nbsp;</td>
                        </tr>
                    </table>
                    <p>&nbsp;</p>
                    <p align="center"><span style="font-size:9pt;"><a href="files/SurfuriyonAddon2Beta.exe"><img src="images/button_download1.gif" width="193" height="32" border="0" name="download" OnMouseOut="download.src='images/button_download1.gif';" OnMouseOver="download.src='images/button_download2.gif';"></a></span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size:9pt;"><a href="center_addon1.php"><img src="images/button_cencel1.gif"
width="193" height="32" border="0" name="cencel" OnMouseOut="cencel.src='images/button_cencel1.gif';" OnMouseOver="cencel.src='images/button_cencel2.gif';"></a></span></p>
                    <p>&nbsp;</p>
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