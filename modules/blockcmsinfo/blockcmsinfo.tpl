{if $infos|@count > 0}
  <div id="cmsinfo_block">
    <h2>О НАС</h2>
    {foreach from=$infos item=info}
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
	<div class="">
	  {$info.text}
	</div>
      </div>
    {/foreach}
  </div>
{/if}