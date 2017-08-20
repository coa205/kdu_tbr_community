<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
            var wsUri = "ws://localhost:8080/TBR_community/echo.do";
			setting_message();
            
            function init() {
                output = document.getElementById("output");
            }

            function setting_message() {
                websocket = new WebSocket(wsUri);
                websocket.onopen = function(evt) {
                    onOpen(evt)
                };
				websocket.onmessage = function(evt) {
	            	onMessage(evt)
	            };
                websocket.onerror = function(evt) {
                    onError(evt)
                };
            }

			function send(){
				doSend("<b>${loginnick}</b>: " + textID.value + "<br>");
			}

            function onOpen(evt) {
                doSend(evt);
            }

            function onMessage(evt) {
				writeToScreen(evt.data);
				websocket.send("");
            }

            function onError(evt) {
                writeToScreen('ERROR: ' + evt);
            }

            function doSend(message) {
                websocket.send(message);
                //websocket.close();
            }

            function writeToScreen(message) {
				var pre = document.createElement("span");
				pre.style.wordWrap = "break-word";
				pre.innerHTML = message;
				
				output.appendChild(pre);	
            }

            window.addEventListener("load", init, false);
        </script>
		<table border="1">
			<tr>
				<th style="background:#F9F9F9;">대화내용</th>
				<th style="background:#F9F9F9;">접속자</th>
			</tr>
			<tbody>
				<tr>
					<td style="width: 500px; height: 500px;">
						<div id="output" style="width: 500px; height: 500px;"></div>
					</td>
					<td style="width: 100px; height: 500px;">
					</td>
				</tr>
				<tr>
					<td colspan="2" style="width: 100%;">
						<form action="">
	                		<input id="textID" name="message" type="text" style="width: 55%; float:left;">
							<input onclick="send()" value="보내기" type="button" style="width: 90px; float:left; margin-left:10px;">
	           	 		</form>
					</td>
				</tr>
			</tbody>
		</table>
</body>
</html>
<!-- memo
	<body onLoad="javascript:open_win();">
 -->