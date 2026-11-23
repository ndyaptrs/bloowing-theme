{block name='header_top'}
<nav class="bloowing-nav">
  <a href="{$urls.base_url}" class="logo" style="text-decoration:none;">
    <div class="flower-logo"></div>
    bloowing.flower
  </a>

  <div class="menu">
    <a href="{$urls.base_url}">Beranda</a>
    <a href="{$urls.pages.category}?id_category=2">Katalog</a>
    <a href="{$urls.pages.history}">Pesanan</a>
    <a href="{$urls.pages.my_account}">{if $customer.is_logged}{$customer.firstname}{else}Akun{/if}</a>
    <a href="{$urls.pages.cart}" class="cart" style="text-decoration:none;">🛒 <small>({$cart.products_count})</small></a>
  </div>
</nav>
{/block}
