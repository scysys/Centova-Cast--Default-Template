{resource type="js" class="progress"}

<script language="javascript">
$(function() {
	/*
	var pw1 = new ProgressWindow();
	console.log('1: pw1.buttons.length: '+pw1.buttons.length);

	var pw2 = new ProgressWindow();
	console.log('2: pw1.buttons.length: '+pw1.buttons.length);
	console.log('2: pw2.buttons.length: '+pw2.buttons.length);
	*/

	var Animal = Class.extend({

		meinname: 'animal',

		poot: 0,
		items: [],

		init: function init(foo) {
			console.log('Animal.init()');
			this.items.push(foo);
			this.poot = foo;
			console.log('Animal: this.items.length = '+this.items.length);
		},

		speak: function() {
			return "generic animal noise";
		},

		stroke: function stroke() {
			console.log('Animal.stroke');
		}


	});

	var Wolf = Animal.extend({
		meinname: 'wolf',

		init: function init(foo) {
			console.log('Wolf.init(), calling parent init()');
			this.getParentMethod().call(this,foo);
			console.log('Wolf: this.items.length = '+this.items.length);
		},

		speak: function() {
			return "Bark, formerly "+this.getParentMethod().call(this);
		},

		stroke: function() {
			console.log('Wolf.stroke');
			this.getParentMethod().call(this);
		}


	});

	var Dog = Wolf.extend({
		meinname: 'dog',

		init: function init(foo) {
			console.log('Dog.init(), calling parent init()');
			this.getParentMethod().call(this,foo);
			console.log('Dog: this.items.length = '+this.items.length);
		},

		speak: function() {
			return "Woof, formerly "+this.getParentMethod().call(this);
		},

		stroke: function stroke() {
			console.log('Dog.stroke');
			this.getParentMethod().call(this);
		}

	});

	if (0) {
		var dog = new Dog(1);
		dog.stroke();
	} else {
		console.log('about to call new Dog(1)');
		var test1 = new Dog(1);
		test1.items.push('foot');
		console.log('done new Dog(1)')
		console.log("1: test1.items.length: " + test1.items.length);
		console.log("1: test1.poot: " + test1.poot);

		console.log('about to call new Dog(2)');
		var test2 = new Dog(2);
		console.log('done new Dog(2)')
		console.log("2: test1.items.length: " + test1.items.length);
		console.log("2: test1.poot: " + test1.poot);
		console.log("2: test2.items.length: " + test2.items.length);
		console.log("2: test2.poot: " + test2.poot);

		//	var an = new Animal(0);

		console.log('dog speak: ' + test2.speak());
		//console.log('animal spaek: '+an.speak());
	}


});
</script>
<div class="tablewrapper" style="margin-bottom: 4px">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
<tr><th colspan="2">{="Web Interface System Information"}</th></tr>
<tr><td width="150" class="roweven">{="Version number"}</td>	<td class="roweven" style="font-weight: bold">{$_CONSTANTS.PRODUCT_REVISION}</td></tr>
<tr><td class="rowodd">{="Build date"}</td>	<td class="rowodd" style="font-weight: bold">{$_CONSTANTS.BUILD_DATE}</td></tr>
<tr><td class="roweven">{="Hostname"}</td>	<td class="roweven" style="font-weight: bold">{$hostname}</td></tr>
<tr><td class="rowodd">{="Operating system"}</td>			<td class="rowodd" style="font-weight: bold">{$systeminfo.osbrief} {$systeminfo.osdetails}</td></tr>
<tr><td class="rowodd">{="Machine"}</td>					<td class="rowodd" style="font-weight: bold">{$systeminfo.machine}</td></tr>

<tr><td class="roweven">{="Total memory"}</td>				<td class="roweven" style="font-weight: bold">{$systeminfo.memtotal|bytes}</td></tr>
<tr><td class="rowodd">&nbsp;&nbsp;{="Unused memory"}</td>	<td class="rowodd" style="font-weight: bold">{$systeminfo.memfree|bytes}</td></tr>
<tr><td class="roweven">&nbsp;&nbsp;{="Buffers"}</td>		<td class="roweven" style="font-weight: bold">{$systeminfo.buffers|bytes}</td></tr>
<tr><td class="roweven">&nbsp;&nbsp;{="Cached"}</td>		<td class="roweven" style="font-weight: bold">{$systeminfo.memcached|bytes}</td></tr>
<tr><td class="rowodd">&nbsp;&nbsp;{="Available memory"}</td><td class="rowodd" style="font-weight: bold">{$systeminfo.memavail|bytes}</td></tr>
<tr><td class="rowodd">&nbsp;&nbsp;{="Swap free"}</td>		<td class="rowodd" style="font-weight: bold">{$systeminfo.swapfree|bytes}/{$systeminfo.swaptotal|bytes}</td></tr>

<tr><td class="roweven">{="Uptime"}</td>					<td class="roweven" style="font-weight: bold">{$systeminfo.uptime}</td></tr>
<tr><td class="rowodd">{="System load"}</td>				<td class="rowodd" style="font-weight: bold">{$systeminfo.cpuload}</td></tr>
<tr><td class="roweven">{="Last cron job"}</td>				<td class="roweven" style="font-weight: bold">{="Started %s, completed %s",$settings.lastcjstart,$settings.lastcjcomplete}</td></tr>
<tr><td class="rowodd">{="Total accounts"}</td>				<td class="rowodd" style="font-weight: bold">{$systeminfo.accounts}</td></tr>
<tr><td class="roweven">{="Active accounts"}</td>			<td class="roweven" style="font-weight: bold">{$systeminfo.activeaccounts}</td></tr>
{loop $other=$systeminfo.other}
	<tr><td class="roweven">{$_loop.key}</td>			<td class="roweven" style="font-weight: bold">{$other.1}</td></tr>
{/loop}
</table>
</div>

<div class="tablewrapper" style="margin-bottom: 4px">
<table class="listtable" width="100%" cellspacing="1" cellpadding="2">
<tr><th colspan="2">{="Web Interface Configuration"}</th></tr>
<tr><td width="150" class="rowodd">{="CAST_PATH"}</td>			<td class="rowodd" style="font-weight: bold">{$_CONSTANTS.CAST_PATH}</td></tr>
{loop $value=$config}
<tr><td class="{if $_loop.odd}rowodd{else}roweven{/if}">{$_loop.key}</td><td class="{if $_loop.odd}rowodd{else}roweven{/if}""{if $value!=""} style="font-weight: bold">{$value}{else} style="color: #909090">(empty){/if}</td></tr>
{/loop}
</table>
</div>


{box}

{="%s is a registered trademark of %s","SHOUTcast","Radionomy Group"}<br />
{="%s was designed by %s.","Icon set","<a style='font-weight: normal; text-decoration: none' target='_blank' href='http://p.yusukekamiyamane.com/'>Yusuke Kamiyamane</a>"}<br />
{="%s was designed by %s","Flag icon set","<a style='font-weight: normal; text-decoration: none' target='_blank' href='http://famfamfam.com/'>Mark James</a>"}<br /><br />
{="For support and updates, please visit %s","<a href='http://www.centova.com' target='_blank'>www.centova.com</a>."}

{/box}
