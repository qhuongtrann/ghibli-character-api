<#import "layout.ftlh" as layout>
<@layout.page title="Character Not Found">

  <div class="card p-5 text-center shadow-sm mx-auto" style="max-width: 600px;">
    <h1 class="display-5 fw-bold mb-3" style="color: #865D36;">404 - Spirit Not Found</h1>
    <p class="fs-5 text-secondary mb-4">
      ${errorMessage!"The Studio Ghibli spirit you are looking for has vanished into the spirit realm."}
    </p>
    <div>
      <a href="/" class="btn btn-primary px-4 py-2">&larr; Return to Gallery</a>
    </div>
  </div>

</@layout.page>