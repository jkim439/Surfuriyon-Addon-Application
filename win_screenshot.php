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
function CenterLayer(name) {
document.all[name].style.setExpression("left", "document.body.clientWidth/2 - ErrLayer1.offsetWidth/2");
document.all[name].style.setExpression("top", "document.body.clientHeight/2 - ErrLayer1.offsetHeight/2");
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

// ��ü ȭ������ ��ȯ�ϱ�
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

<title>�Ϳ� ��ǻ���� �̴� Ȩ������</title>

<!-- ���ͳ� ĳ�� ������� �ʱ� -->
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Pragma" content="no-cache">

<!-- �̹��� �������� ������� �ʱ� -->
<meta http-equiv=imagetoolbar content=no>

</head>


<body onload="maximizeWindow();" onselectstart="return false" ondragstart="return false" oncontextmenu="return false" bgcolor="black" text="black" link="white" vlink="white" alink="white" leftmargin="0" marginwidth="0" topmargin="0" marginheight="0" scroll="auto">
                    <div id="TooltipLayer" style="background-color:black; padding:5pt; border-width:1pt; border-color:rgb(117,117,117); border-style:double; width:233px; height:136px; position:absolute; left:154px; top:106px; z-index:2; visibility:hidden; filter:alpha(opacity=80);">
                        <p style="line-height:16pt;"><font color="white"><span style="font-size:9pt;"><b>��ũ�� �� â �ݱ� &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;�׸�<br>
<br>
</b></span></font><span style="font-size:9pt;"><font color="white">��ǻ���� �ֵ�� 2.0�� ��ũ�� ���� ũ�� ����&nbsp;â�Դϴ�.</font><font color="#66FF00"><br>
���ȿ��: ��ũ�� �� â�� ���� �� �ֽ��ϴ�.</font></span></p></div>
<a href="javascript:window.close();"><img src="http://www.vista2006.zc.bz/worldofwarcraft/<?=$src?>" border="0" vspace="0" hspace="0" onmouseover="ShowLayer('TooltipLayer')" onmouseout="HideLayer('TooltipLayer')" onmousemove="MoveLayer('TooltipLayer')">
</a></body>

</html>