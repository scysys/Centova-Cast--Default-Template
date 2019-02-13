<tr>
	<td class="{if $odd}rowodd{else}roweven{/if}">{$app.type}</td>
	<td class="{if $odd}rowodd{else}roweven{/if}">
		<select name="convert[{$app.type}]" class="conversion">
		<option value="">{="Unchanged"}</option>
{loop $alt=$app.alternatives}
	<option value="{$alt.type}"{if $alt.conflict!=""} disabled{/if}>{$alt.type}{if $alt.conflict} ({="incompatible with %s",$alt.conflict}){/if}</option>
{/loop}
		</select>
		
	</td>
</tr>
