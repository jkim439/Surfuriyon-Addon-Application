<html>

<head>

<script language="JavaScript"> 

// ����ǥ���ٿ� �޽��� �����ֱ�
function HideStatus(){ 
window.status='���ڵ� ������! ���� ���� ��ũ����Ʈ�� ��ǻ���� �̴� Ȩ�������Դϴ�.' 
return true 
} 

// ����ǥ���ٿ� ��ũ �����ֱ�
if (document.layers) 
document.captureEvents(Event.MOUSEOVER | Event.MOUSEOUT) 
document.onmouseover=HideStatus
document.onmouseout=HideStatus 
document.onmouseup=HideStatus
document.onmousedown=HideStatus
document.onfocus=HideStatus
document.onclick=HideStatus
document.onload=HideStatus

// ��ũ�� �׵θ� ���ֱ�
function bluring(){
if(event.srcElement.tagName=="A"||event.srcElement.tagName=="IMG") document.body.focus();
}
document.onfocusin=bluring;

// ���̾ �߾ӿ� ���߱�
function CenterLayer1() {
document.all.ErrLayer1.style.setExpression("left", "document.body.clientWidth/2 - ErrLayer1.offsetWidth/2");
document.all.ErrLayer1.style.setExpression("top", "document.body.clientHeight/2 - ErrLayer1.offsetHeight/2");
}

// ���̾ �����ֱ�
function ShowLayer(name) {
document.all[name].style.visibility = "visible";
}

// ���̾ �����ֱ�
function HideLayer(name) {
document.all[name].style.visibility = "hidden";
}

// ���̾ �̵���Ű��
function MoveLayer(name) {
oElement = document.elementFromPoint(event.x, event.y);
document.all[name].style.pixelLeft=event.x+10;
document.all[name].style.pixelTop=event.y+1;
}

</script> 

<title>�Ϳ� ��ǻ���� �̴� Ȩ������</title>

<!-- ���ͳ� ĳ�� ������� �ʱ� -->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<!-- �̹��� �������� ������� �ʱ� -->
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
                                <p style="line-height:16pt; margin-left:30pt;"><span style="font-size:9pt;"><b><font color="#FFCC00">[����] ��ǻ���� �ֵ�� 2.0.2 ���� ���� ��� ����&nbsp;(2006.07.08)</font></b></span><font color="white"><span style="font-size:9pt;"><br>
<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">���� '��ǻ���� �ֵ�� 2 ��Ÿ' </span></font><font color="white"><span style="font-size:9pt; line-height:150%;">������ ���� ������ �����ֽ� �е鲲 ���� ������ ���� �ø��ϴ�.<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;"><br>
�׵��� �̷�Դ� ���� ������ '��ǻ���� �ֵ�� 2.0.2' �� 7���� ����&nbsp;������ �����Դϴ�.<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">���� �⸻��� �����ڸ��� ����Ϸ��� ������ ���۽����� ���� ���� ��ũ����Ʈ�� 1.11 ��ġ��<br>
</span></font><font color="white"><span style="font-size:9pt; line-height:150%;">�����ϴ� �ٶ��� �� ����������, �ִ��� ���� ���ϳ��� ����� �� �ֵ��� ����ϰ� �ֽ��ϴ�.</span></font></p>
                                <p style="line-height:16pt; margin-left:30pt;"><font color="white"><span style="font-size:9pt;">�� ��õǴ� ���� ������ '��ǻ���� �ֵ�� 2.0.2' �� ���� ������ �����ֽñ� �ٶ��ϴ�.</span></font><font color="white"><span style="font-size:9pt;"><br>
</span></font><font color="white"><span style="font-size:9pt;">������ ���� �̿� ��Ź�帳�ϴ�. �����մϴ�.<br>
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