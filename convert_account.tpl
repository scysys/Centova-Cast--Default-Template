<form method="post" action="{$_SERVER.REQUEST_URI|htmlentities}">
	
{if $successful}
{box title="Update Successful"}{="Software change performed successfully"}.{/box}
{elseif $failure}
	{box title="Update Failed"}{="An error occurred while attempting to perform this software change"}:<br><br><span style="color: red">{$error}</span>{/box}
{/if}

{box title="Account Software Change"}
	<p>
		<strong>{="WARNING"}:</strong> 
		{="While a best-effort attempt will be made to copy as many configuration settings as possible, changing an account's software type %swill always result in some settings being lost%s because not all settings may have direct equivalents in the target software.","<strong>","</strong>"}
		{="Some manual reconfiguration will likely be necessary after the change."}
	</p>
	<p>
	{="It is strongly recommended that you %sback up the account%s prior to performing a software conversion. Note that aside from restoring from backup, it is not possible to revert the changes made by this utility.","<strong>","</strong>"}
	</p>
{/box}
	

<div class="tablewrapper" style="margin-bottom: 4px">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
	<tr>
		<th>{="Current"}</th>
		<th>{="Change To"}</th>
	</tr>
{$convert_apps}
</table>
</div>

{box title="Continue"}
<input type="hidden" name="username" value="{$username|htmlentities}" />
<input type="submit" name="update" value="{="Perform conversion"}" />
{/box}
</form>

{onready}
<script>
	var $conversions = $('select.conversion');
	$conversions.change(function(){
		var $select = $(this);
		var $selected = $select.find('option:selected');
		var name = $select.prop('name').replace("\[",'\\[').replace('\]','\\]');
		var disabled = $selected.val() !== "";
		$conversions.filter('[name!="'+name+'"]').prop('disabled',disabled);
	})
</script>
{/onready}