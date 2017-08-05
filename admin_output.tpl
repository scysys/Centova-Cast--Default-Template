<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<title>{="Centova Cast Diagnostic Output"}</title>

{resource class="common" type="js"}
{resource class="common" type="css"}
{resource class="rpc" type="js"}
{resource type="js" src="/system/progressiveoperation.js" depends="common,rpc"}
{get_resources}

	<script language="javascript" type="text/javascript">

var OutputHandler = ProgressHandler.extend({

	log: function(message,submessage,type) {
		var $log = $('#log');
		var $entry = $('<div/>',{
			'class': 'log_' + type
		}).html(message);

		if (submessage && submessage.length) $entry.append(
			$('<span/>').html(submessage)
		);

		$log.append($entry);
		$(window).scrollToBottom();
	},

	data: function(message,submessage) { this.log(message,submessage,'data'); },
	info: function(message,submessage) { this.log(message,submessage,'info'); },
	debug: function(message,submessage) { this.log(message,submessage,'debug'); },
	failure: function(message,submessage) { this.log(message,submessage,'failure'); },
	success: function(message,submessage) { this.log(message,submessage,'success'); },

	progress: function(percent,message) {
		if (message && message.length) {
			this.log(percent+'% - '+message,NULL,'info');
		}
	}

});
function stop_output_log_handler() {
	window.op.handler.success('Output logging disabled.');
}

function disable_logging() {
	$('#disablebtn').prop('disabled',true);
	window.rpc = new RPCClient('rpc.php','stopoutoutlog');
	window.rpc.set_callback(method,stop_output_log_handler);
	window.rpc.execute('utilities.outputlog',0);
}

$(function(){

	var progress_handler = new OutputHandler();
	progress_handler.info("Initializing output handler ...");
	window.op = new ProgressiveOperation(
		'utilities.outputlog',
		1,
		'window.op',
		progress_handler
	);

});
	</script>

	<style type="text/css">
body {
	background-color: #000;
	color: #777;
	font-size: 12px;
	font-family: "Courier New",Courier,monospace;
}
.log_data { color: #F00; }
.log_info { color: #777; }
.log_debug { color: #F70; }
.log_failure { color: #F44; }
.log_success { color: #4C4; }

#disablebtn {
	position: fixed;
	top: 5px;
	right: 5px;
}

	</style>
</head>
<body>
	<button onclick="disable_logging()" id="disablebtn">{="Disable Logging"}</button>
	<div id="log"></div>
</body>
</html>