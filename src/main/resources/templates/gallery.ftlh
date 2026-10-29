<#import "layout.ftlh" as layout>
<@layout.page title="Studio Ghibli Spirits Gallery" activePage="home">

  <h1 class="text-center mb-2">Studio Ghibli Characters Gallery</h1>
  <p class="text-center text-muted mb-4">Explore mystical little creatures across the Studio Ghibli world</p>

  <!-- Working Search and Universe Filter Form -->
  <form action="/" method="get" class="row g-2 justify-content-center mb-5">
    <div class="col-md-5">
      <input type="text" name="name" value="${searchName}" class="form-control shadow-sm" placeholder="Search spirits by name...">
    </div>
    <div class="col-md-4">
      <select name="universe" class="form-select shadow-sm">
        <option value="" ${(selectedUniverse == "")?then("selected", "")}>All Universes / Films</option>
        <option value="Spirited Away" ${(selectedUniverse == "Spirited Away")?then("selected", "")}>Spirited Away</option>
        <option value="My Neighbor Totoro" ${(selectedUniverse == "My Neighbor Totoro")?then("selected", "")}>My Neighbor Totoro</option>
        <option value="My Neighbor Totoro & Spirited Away" ${(selectedUniverse == "My Neighbor Totoro & Spirited Away")?then("selected", "")}>My Neighbor Totoro & Spirited Away</option>
        <option value="Howl's Moving Castle" ${(selectedUniverse == "Howl's Moving Castle")?then("selected", "")}>Howl's Moving Castle</option>
        <option value="The Boy and the Heron" ${(selectedUniverse == "The Boy and the Heron")?then("selected", "")}>The Boy and the Heron</option>
        <option value="Princess Mononoke" ${(selectedUniverse == "Princess Mononoke")?then("selected", "")}>Princess Mononoke</option>
        <option value="Ponyo" ${(selectedUniverse == "Ponyo")?then("selected", "")}>Ponyo</option>
      </select>
    </div>
    <div class="col-md-auto d-flex gap-2">
      <button type="submit" class="btn btn-primary px-4">Search</button>
      <#if (searchName?has_content) || (selectedUniverse?has_content)>
        <a href="/" class="btn btn-outline-secondary">Reset</a>
      </#if>
    </div>
  </form>

  <!-- Character Cards Grid or Empty State -->
  <#if characters?size == 0>
    <div class="card p-5 text-center shadow-sm">
      <h3 class="card-title mb-2">No characters found</h3>
      <p class="text-secondary mb-3">No Studio Ghibli spirits matched your search criteria.</p>
      <div>
        <a href="/" class="btn btn-dark">Show All Spirits</a>
      </div>
    </div>
  <#else>
    <div class="row row-cols-1 row-cols-md-3 g-4">
      <#list characters as c>
        <div class="col">
          <div class="card h-100 character-card shadow-sm">
            <#if c.imageUrl?? && c.imageUrl?has_content>
              <img src="${c.imageUrl}" class="card-img-top" alt="${c.name}" onerror="this.src='https://placehold.co/400x500/2b251f/f7f5f2?text=Ghibli+Spirit';">
            <#else>
              <img src="https://placehold.co/400x500/2b251f/f7f5f2?text=No+Image" class="card-img-top" alt="Placeholder">
            </#if>
            <div class="card-body">
              <h5 class="card-title">${c.name}</h5>
              <p class="card-text mb-1"><strong>Universe:</strong> ${(c.universe?has_content)?then(c.universe, "Unknown")}</p>
              <p class="card-text mb-1"><strong>Role:</strong> ${(c.role?has_content)?then(c.role, "Unknown")}</p>
              <p class="card-text mb-2"><strong>Species:</strong> ${(c.species?has_content)?then(c.species, "Spirit")}</p>
              <a href="/characters/${c.characterId}" class="btn btn-sm btn-dark w-100 mt-2">View Details</a>
            </div>
          </div>
        </div>
      </#list>
    </div>
  </#if>

</@layout.page>