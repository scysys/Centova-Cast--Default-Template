{box title="Edit Account"}

	{check $successful}
	{="Configuration updated successfully."}
	{if !$reseller}{="Note that you will need to restart your server for the changes to take effect."}{/if}
	
	{if $charsetchanged}
	<br /><br />
	{="Your preferred character encoding has also been changed."}
	{="Note that if you have already imported any media, you should %sclick here%s now to update your media library with the new character encoding.","<a href='index.php?page=importmedia&full=1'>","</a>"}
	{/if}
	
	
	{otherwise}
	{="Configuration could not be updated"}{if $reason}: {$reason}{/if}.
	{/check}
	<br /><br />
	
	<a href="{if $istemplate}index.php?page=accounttemplates{elseif ($account_isreseller>0) and ($user_isreseller>0)}index.php?page=configure{elseif $privileged}index.php?page=accounts&action=edit&username={$username}{else}index.php?page=configure{/if}">{="Return"}</a>
{/box}