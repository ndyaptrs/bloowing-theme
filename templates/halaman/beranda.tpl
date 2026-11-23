{extends file='page.tpl'}
{block name='page_content_container'}
  {include file='komponen/hero.tpl'}
  {include file='komponen/fitur.tpl'}
  <section class="section">
    <div class="section-title">
      <h2>Kategori Buket</h2>
      <a href="{$urls.pages.category}?id_category=2">Lihat Semua →</a>
    </div>
    {hook h='displayHome'}
  </section>
{/block}
