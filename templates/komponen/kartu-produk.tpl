{block name='product_miniature_item'}
<div class="product js-product" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}">
  <a href="{$product.url}" style="text-decoration:none; color:inherit;">
    <div class="product-image">
      {if $product.name|strstr:'Mawar'}🌹
      {elseif $product.name|strstr:'Sunflower'}🌻
      {elseif $product.name|strstr:'Mix'}🌸
      {elseif $product.name|strstr:'Baby'}💐
      {elseif $product.cover && !$product.cover.bySize.home_default.url|strstr:'default'}
        <img src="{$product.cover.bySize.home_default.url}" alt="{$product.name}" style="max-height:150px; width:auto; border-radius:12px;">
      {else}🌷{/if}
    </div>
  </a>
  <div class="product-info">
    <h3><a href="{$product.url}" style="text-decoration:none; color:#4a2735;">{$product.name}</a></h3>
    <div class="price">{$product.price}</div>
    <a href="{$product.url}" class="detail-btn">Lihat Detail</a>
  </div>
</div>
{/block}
