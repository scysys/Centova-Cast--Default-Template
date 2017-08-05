{if $error}
	{box title="Error"}
		{="An error occurred while attempting to compress your logs"}:<br /><br />
		
		{$error}
	{/box}
	
{else}
	{box title="Please wait"}
		{="Your logs are being compressed now and your download will begin in a few moments."}<br /><br />
		
		{="Depending on the size and number of logs in your account, this may take some time -- please be patient.  Navigating away from this web page will cancel your download."}
	{/box}
    
	<script language="javascript">
	function begin_download() {
		window.location='{$pageself}&type=download&archive=1';
	}
	function do_download() {
		setTimeout('begin_download()',2500);
	}
	window.onload = do_download;
	</script>
{/if}