{if $page_name =='category' && isset($category)}
  {if $category->id && $category->active}
    {if $scenes || $category->description || $category->id_image}
      <div class="content_scene_cat">
        {if $scenes}
          <div class="content_scene">
            <!-- Scenes -->
            {include file="$tpl_dir./scenes.tpl" scenes=$scenes}
            {if $category->description}
              <div class="cat_desc">
                <div>{$category->description}</div>
              </div>
            {/if}
          </div>
        {else}
          <!-- Category image -->
          <div class="content_scene_cat_bg" {if $category->id_image} style="background-image: url('{$link->getCatImageLink($category->link_rewrite, $category->id_image, 'tm_category_default')|escape:'html':'UTF-8'}')" {/if}>
            {if $category->description}
              <div class="container">
                <div class="cat_desc">
                  <span class="category-name">
                    {strip}
                      {$category->name|escape:'html':'UTF-8'}
                      {if isset($categoryNameComplement)}
                        {$categoryNameComplement|escape:'html':'UTF-8'}
                      {/if}
                    {/strip}
                  </span>
                  <div class="category-description">{$category->description}</div>
                </div>
                {if isset($subcategories)}
                  {if (isset($display_subcategories) && $display_subcategories eq 1) || !isset($display_subcategories)}
                    <!-- Subcategories -->
                    <div id="subcategories" class="row">
                      <ul class="col-sm-6 col-md-4">
                        {foreach from=$subcategories item=subcategory name=subcat}
                          {if ($smarty.foreach.subcat.index % 4 == 0 && $smarty.foreach.subcat.index != 0)}
                        </ul>
                        <ul class="col-sm-6 col-md-4">
                          {/if}
                          <li><a class="subcategory-name" href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'html':'UTF-8'}" title="{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'|truncate:50}">{$subcategory.name|truncate:25:'...'|escape:'html':'UTF-8'}</a></li>
                        {/foreach}
                      </ul>
                    </div>
                  {/if}
                {/if}
              </div>
            {/if}
          </div>
        {/if}
      </div>
    {/if}
  {elseif $category->id}
    <p class="alert alert-warning">{l s='This category is currently unavailable.'}</p>
  {/if}
{/if}