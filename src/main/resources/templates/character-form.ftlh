<#import "layout.ftlh" as layout>
<#assign pageTitle = isEdit?then("Edit " + (character.name!"Spirit"), "Add a Ghibli Spirit")>
<#assign activeNav = isEdit?then("", "add")>

<@layout.page title=pageTitle activePage=activeNav>

  <div class="row justify-content-center">
    <div class="col-md-8">
      <div class="card p-4 p-md-5 shadow-sm border-0">
        <h2 class="mb-2 text-center" style="color: #865D36;">
          ${isEdit?then("Edit Character Details", "Add a New Character to the Gallery")}
        </h2>
        <p class="text-center text-muted small mb-4">
          ${isEdit?then("Update the attributes for this Studio Ghibli spirit.", "Submit another character to the gallery database.")}
        </p>

        <#if errorMessage??>
          <div class="alert alert-danger">${errorMessage}</div>
        </#if>

        <#assign formAction = isEdit?then("/characters/" + character.characterId + "/edit", "/characters")>
        <form action="${formAction}" method="post">
          <div class="mb-3">
            <label class="form-label fw-semibold">Character / Spirit Name <span class="text-danger">*</span></label>
            <input type="text" name="name" value="${character.name!''}" class="form-control" required placeholder="e.g., Kodama (Tree Spirits)">
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Universe / Movie Title</label>
            <input type="text" name="universe" value="${character.universe!''}" class="form-control" placeholder="e.g., Princess Mononoke">
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Role in Story</label>
            <input type="text" name="role" value="${character.role!''}" class="form-control" placeholder="e.g., Sign of a healthy forest">
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Species</label>
            <input type="text" name="species" value="${character.species!''}" class="form-control" placeholder="e.g., Tree Spirit">
          </div>

          <div class="mb-3">
            <label class="form-label fw-semibold">Image URL</label>
            <input type="text" name="imageUrl" value="${character.imageUrl!''}" class="form-control" placeholder="https://example.com/image.jpg or /warawara.webp">
          </div>

          <div class="mb-4">
            <label class="form-label fw-semibold">Description / Backstory <span class="text-danger">*</span></label>
            <textarea name="description" class="form-control" rows="4" required placeholder="Describe their appearance and mystical habits...">${character.description!''}</textarea>
          </div>

          <div class="d-flex gap-2">
            <button type="submit" class="btn btn-dark flex-grow-1">
              ${isEdit?then("Save Changes", "Submit Spirit")}
            </button>
            <#if isEdit>
              <a href="/characters/${character.characterId}" class="btn btn-outline-secondary">Cancel</a>
            <#else>
              <a href="/" class="btn btn-outline-secondary">Cancel</a>
            </#if>
          </div>
        </form>
      </div>
    </div>
  </div>

</@layout.page>