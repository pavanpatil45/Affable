function msgFormat(who) {
	var msgDiv = document.createElement("DIV");
	var attachClass;

	if(who == 0) {
		msgDiv.id = "user1";
		attachClass = "user1Attach";
	}
	else {
		msgDiv.id = "user2";
		attachClass = "user2Attach";
	}

	return [msgDiv, attachClass];
}

function retrieve_chats(userid, questionid) {
	$.ajax({
		url: "retrieve_chats.php",
		method: "POST",
		data: {userid:userid, msgCnt:msgCnt, questionid:questionid},
		success: function(msgs) {
			var msgs = JSON.parse(msgs);
			for(var msg of msgs) {
				var format = msgFormat(msg[4]);
				var msgDiv = format[0];

				var html = "";
				if(msg[0] != '')
					html += (msg[0] + "<br>");
				if(msg[1] != '')
					html += ("Download <a href='attachments/" + msg[2] + "' class='" + format[1] + "' download>" + msg[1] + "</a><br>");
				html += "<span class='date-time'>" + msg[3] + "</span>";

				msgDiv.innerHTML = html;
				document.getElementById("chats").appendChild(msgDiv);
				
				$("#chats").animate({ 
                    scrollTop: document.getElementById("chats").scrollHeight 
                }, 0);

				msgCnt++;
			}
		}
	});
}

var msgCnt = 0;
var ID = 0;
function chat(userid, user, questionid) {
	document.getElementById("chats").innerHTML = "";
	msgCnt = 0;
	window.clearInterval(ID);
	ID = window.setInterval(retrieve_chats, 1000, userid, questionid);

	document.getElementById("chatModalLabel").innerHTML = user;
	document.getElementById("msg").value = "";

	document.getElementById("send-msg").setAttribute("onclick", "sendMsg('"+ userid +"', '" + questionid + "')");
	document.getElementById("clr-msgs").setAttribute("onclick", "clearChats('"+ userid +"', '" + user + "', '" + questionid + "')");
	document.getElementById("export-chat").setAttribute("onclick", "exportChat('"+ userid +"', '" + user + "', '" + questionid + "')");
}

function sendMsg(userid, questionid) {
	var msg = document.getElementById("msg").value;
	var attachedFile = $('#attachedFile')[0].files[0];

	var formData = new FormData();
	formData.append('userid', userid);
	formData.append('msg', msg);
	formData.append('questionid', questionid);
	formData.append('attachedFile',attachedFile);

	$.ajax({
		url: "send_message.php",
		method: "POST",
		data: formData,
		contentType: false,
		processData: false,
		success: function() {
			document.getElementById("msg").value = "";
			document.getElementById("attachedFile").value = "";
		}
	});
}

function disconnectChat() {
	$('#disconnectChatModal').modal('show');
}

function closeChat() {
	$('#disconnectChatModal').modal('hide');
	$('#connectToChat').modal('hide');
}

function clearChats(userid, user, questionid) {
	document.getElementById("confirm-clr-msgs").setAttribute("onclick", "confirmClearChats('"+ userid +"', '" + user + "', '" + questionid + "')");
	$('#clrChatsModal').modal('show');
}

function confirmClearChats(userid, user, questionid) {
	$.ajax({
		url: "clear_chats.php",
		method: "POST",
		data: {userid:userid, questionid:questionid},
		success: function() {
			chat(userid, user, questionid);
			$('#clrChatsModal').modal('hide');
		}
	});
}

function exportChat(userid, user, questionid) {
	$.ajax({
		url: "export_chat.php",
		method: "POST",
		data: {userid:userid, user:user, questionid:questionid},
		success: function(filename) {
			exportLink.href = "export_chat/" + filename;
			document.getElementById('exportLink').click();
		}
	});
}

$(document).ready(function() {
	$("#msg").keydown(function(event) {
		if (event.keyCode === 13) {
			$("#send-msg").click();
		}
	});
});
