{extends file='page.tpl'}

{block name='page_content_container'}
<div class="bloowing-catalog-wrap">
  <section class="header">
    <small>🌷 BLOOWING.FLOWER</small>
    <h1>{$category.name|default:'Katalog Buket'}</h1>
    <p>Temukan buket bunga terbaik untuk setiap momen spesial.</p>
  </section>

  <form action="{$urls.pages.search}" method="get" class="search-box">
    <input type="hidden" name="controller" value="search">
    <input type="text" name="s" placeholder="🔍 Cari buket..." value="{$search_string|default:''}">
    <select onchange="if(this.value) window.location.href=this.value;">
      <option value="{$urls.pages.category}?id_category=2">Semua Kategori</option>
      {foreach from=$subcategories item=subcat}
        <option value="{$subcat.url}" {if $category.id == $subcat.id_category}selected{/if}>{$subcat.name}</option>
      {/foreach}
    </select>
  </form>

  <section class="products">
    {foreach from=$listing.products item=product}
      {include file='catalog/_partials/miniatures/product.tpl' product=$product}
    {/foreach}
  </section>
</div>
{/block}
