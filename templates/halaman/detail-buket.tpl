{extends file='page.tpl'}

{block name='page_content_container'}
<div class="bloowing-detail-container">
  <div class="detail">
    <div class="gambar">
      {if $product.default_image}
        <img src="{$product.default_image.bySize.large_default.url}" alt="{$product.name}">
      {else}
        🌷
      {/if}
    </div>

    <div class="info">
      <h1>{$product.name}</h1>

      <div class="kategori">
        {$product.category_name|default:'Buket Bunga'}
      </div>

      <div class="harga">
        {$product.price}
      </div>

      <div style="color:#765663; line-height:1.7; margin-bottom:18px;">
        {$product.description_short nofilter}
        {if !$product.description_short}
          Buket bunga cantik dari bloowing.flower.
        {/if}
      </div>

      <div class="stok">
        Stok tersedia: <strong>{$product.quantity}</strong>
      </div>

      <form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
        <input type="hidden" name="token" value="{$static_token}">
        <input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
        <input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
        <input type="hidden" name="qty" value="1">

        <button class="btn btn-add-cart add-to-cart" data-button-action="add-to-cart" type="submit" {if !$product.add_to_cart_url}disabled{/if}>
          🛒 Tambah ke Keranjang
        </button>
      </form>

      <a href="{$urls.pages.category}?id_category=2" class="kembali">
        ← Kembali ke Katalog
      </a>
    </div>
  </div>
</div>
{/block}
