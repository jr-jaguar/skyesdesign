{*
* 2002-2015 TemplateMonster
*
* TemplateMonster Deal of Day
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade the module to newer
* versions in the future.
*
*  @author    TemplateMonster (Sergiy Sakun)
*  @copyright 2002-2016 TemplateMonster
*  @license   http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*}
<div class="clearfix"></div>
<div id="daydeal-products" class="block products_block">
	<h4 class="title_block">{l s='Deal of the day' mod='tmdaydeal'}</h4>
	<div class="block_content">
        {if isset($daydeal_products) && $daydeal_products}
		<ul class="products clearfix row">
        {foreach from=$daydeal_products item=product name=product}

            {assign var='id_image' value=$product->getCover($product->id)}
            {assign var='product_link' value=$link->getProductLink($product)}
            {assign var='product_id' value=$product->id}
            {assign var='label' value=$daydeal_products_extra[$product->id]["label"]}
            {assign var='data_start' value=$daydeal_products_extra[$product->id]["data_start"]}
            {assign var='data_end' value=$daydeal_products_extra[$product->id]["data_end"]}
            {assign var='reduction_type' value=$daydeal_products_extra[$product->id]["reduction_type"]}
            {assign var='discount_price' value=$daydeal_products_extra[$product->id]["discount_price"]}

            <li class="col-xs-6 col-sm-3 col-md-3">
                <a class="product_img_link" href="{$product_link|escape:'htmlall':'UTF-8'}" title="{$product->name|escape:'htmlall':'UTF-8'}">
                	<img class="img-responsive" src="{$link->getImageLink($product->link_rewrite, $id_image['id_image'], 'home_default')|escape:'html':'UTF-8'}" alt="{$product->name|escape:'htmlall':'UTF-8'}" />
                    {if isset($label) && $label}
                        <span class="label-daydeal">{$label|escape:'htmlall':'UTF-8'}</span>
                    {/if}
                </a>

                {$comment.id_product = $product->id}
                {hook h='displayProductListReviews' product=$comment}


                <h5>
               		<a class="product-name" href="{$product_link|escape:'htmlall':'UTF-8'}" title="{$product->name|escape:'htmlall':'UTF-8'}">{$product->name|escape:'html':'UTF-8'}</a>
                </h5>
                {if (!$PS_CATALOG_MODE && $product->show_price && !isset($restricted_country_mode))}
                   {hook h="displayProductPriceBlock" product=$product type="old_price"}
                    <span class="price product-price">{convertPrice price=$product->price}</span>

					{if $product->specificPrice.reduction > 0 && $product->specificPrice.reduction}
                    	<span class="old-price product-price">{convertPrice price=$product->getPriceWithoutReduct(false, $smarty.const.NULL)}</span>
                        {if $product->specificPrice.reduction_type == 'percentage'}
                            <span class="price-percent-reduction">-{$product->specificPrice.reduction|escape:'html':'UTF-8'*100}%</span>
                        {/if}
                    {/if}
                {/if}
            </li>
        {/foreach}
        </ul>
        {else}
                <p class="alert alert-info">{l s='No special products at this time.' mod='tmdaydeal'}</p>
        {/if}
	</div>
</div>

