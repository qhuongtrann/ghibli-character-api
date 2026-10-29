<#import "layout.ftlh" as layout>
<@layout.page title="About This Gallery" activePage="about">

  <div class="text-center mb-5">
    <h1 class="display-4 fw-bold">About This Gallery</h1>
    <p class="text-muted">Learn more about our Studio Ghibli spirits collection and how this web app is built.</p>
  </div>

  <div class="row align-items-center mb-5">
    <div class="col-lg-7 mb-4 mb-lg-0">
      <h3 class="fw-bold mb-3" style="color: #ffffff;">Welcome to the Studio Ghibli Spirits Gallery</h3>
      <p style="color: #f7f5f2;">
        Main characters like Totoro, Chihiro, and Howl get most of the attention and merchandise. But when watching Studio Ghibli movies, the background creatures and familiars are often the most fun and charming part. This gallery was created to give the spotlight to those lesser-known, cute side characters like the giant duck spirits relaxing in the bathhouse, Boh turned into a mouse, and the little white spirit puffs waiting to be born.
      </p>

      <h3 class="fw-bold mt-4 mb-3" style="color: #ffffff;">How This App Is Built (Architecture)</h3>
      <p style="color: #f7f5f2;">
        This application is built using a layered <strong>Spring Boot MVC</strong> architecture backed by a cloud <strong>PostgreSQL</strong> database on Neon and deployed via Docker on Render:
      </p>
      <ul style="color: #f7f5f2;">
        <li><strong>Presentation Layer (Front End):</strong> Server-rendered <strong>FreeMarker (<code>.ftlh</code>)</strong> templates styled with Bootstrap 5 and custom CSS. A shared layout template provides consistent navigation across every page.</li>
        <li><strong>Controller Layer:</strong> Divided into two controllers—<code>GhibliCharacterPageController</code> handles browser web routes, form validation, and Post-Redirect-Get flash messages, while <code>GhibliCharacterController</code> provides a full JSON REST API at <code>/api/characters</code>.</li>
        <li><strong>Service Layer:</strong> <code>GhibliCharacterService</code> contains the business logic for searching, filtering by name and universe, creating, updating, and deleting characters.</li>
        <li><strong>Data Access Layer (Back End):</strong> <code>GhibliCharacterRepository</code> uses Spring Data JPA and Hibernate to persist <code>GhibliCharacter</code> entities in PostgreSQL.</li>
      </ul>

      <h3 class="fw-bold mt-4 mb-3" style="color: #ffffff;">Data & Attribution</h3>
      <p style="color: #f7f5f2;">
        The spirits featured in this gallery come from various Studio Ghibli films directed by Hayao Miyazaki, including <em>Spirited Away</em>, <em>My Neighbor Totoro</em>, <em>Howl's Moving Castle</em>, <em>Ponyo</em>, and <em>The Boy and the Heron</em>.
      </p>
    </div>

    <div class="col-lg-5 text-center">
      <img src="https://imaginus.ca/cdn/shop/products/A2184.jpg?v=1685550011" class="img-fluid rounded shadow" alt="Studio Ghibli side characters" style="max-height: 320px; object-fit: cover; width: 100%;">
    </div>
  </div>

  <div class="p-5 text-center rounded shadow-sm" style="background-color: #2b251f;">
    <a href="/" class="btn btn-primary px-4 py-2">View Gallery</a>
  </div>

</@layout.page>