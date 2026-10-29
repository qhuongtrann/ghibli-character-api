<#import "layout.ftlh" as layout>
<@layout.page title="${character.name} - Details">

  <div class="card shadow-lg border-0 overflow-hidden">
    <div class="row g-0">
      <div class="col-md-5">
        <#if character.imageUrl?? && character.imageUrl?has_content>
          <img src="${character.imageUrl}" class="img-fluid h-100 w-100" style="object-fit:cover; min-height: 360px;" alt="${character.name}" onerror="this.src='https://placehold.co/600x700/2b251f/f7f5f2?text=Ghibli+Spirit';">
        <#else>
          <img src="https://placehold.co/600x700/2b251f/f7f5f2?text=No+Image" class="img-fluid h-100 w-100" style="object-fit:cover; min-height: 360px;" alt="No Image Available">
        </#if>
      </div>
      <div class="col-md-7 p-4 p-md-5 d-flex flex-column">
        <h1 class="display-6 fw-bold" style="color: #865D36;">${character.name}</h1>
        <p class="text-muted fs-5 mb-2">${(character.universe?has_content)?then(character.universe, "Studio Ghibli Universe")}</p>
        <hr>
        <ul class="list-unstyled">
          <li class="mb-2"><strong>Character ID:</strong> #${character.characterId}</li>
          <li class="mb-2"><strong>Universe / Film:</strong> ${(character.universe?has_content)?then(character.universe, "N/A")}</li>
          <li class="mb-2"><strong>Role in Story:</strong> ${(character.role?has_content)?then(character.role, "N/A")}</li>
          <li class="mb-2"><strong>Species:</strong> ${(character.species?has_content)?then(character.species, "N/A")}</li>
        </ul>
        <h5 class="mt-3 fw-bold">Backstory & Lore</h5>
        <p class="mb-4">${character.description}</p>

        <div class="mt-auto pt-3 d-flex flex-wrap gap-2 align-items-center">
          <a href="/" class="btn btn-outline-dark">&larr; Back to Gallery</a>
          <a href="/characters/${character.characterId}/edit" class="btn btn-primary">Edit Character</a>
          <form action="/characters/${character.characterId}/delete" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to remove ${character.name?js_string} from the gallery?');">
            <button type="submit" class="btn btn-danger">Delete</button>
          </form>
        </div>
      </div>
    </div>
  </div>

</@layout.page>