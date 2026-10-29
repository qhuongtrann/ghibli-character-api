<#macro page title activePage="">
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>${title} | GhibliSpirits</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="/style.css">
</head>
<body>
  <!-- Shared Navigation Bar -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
      <a class="navbar-brand" href="/">GhibliSpirits</a>
      <div class="navbar-nav">
        <a class="nav-link ${(activePage == 'home')?then('active', '')}" href="/">Home</a>
        <a class="nav-link ${(activePage == 'about')?then('active', '')}" href="/about">About</a>
        <a class="nav-link ${(activePage == 'add')?then('active', '')}" href="/characters/new">Add a Character</a>
      </div>
    </div>
  </nav>

  <!-- Main Content -->
  <main class="container py-5">
    <#if successMessage??>
      <div class="alert alert-success alert-dismissible fade show shadow-sm" role="alert">
        ${successMessage}
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    </#if>

    <#nested>
  </main>

  <footer class="py-3 text-center text-muted small">
    <div class="container">
      <hr>
      <p class="mb-0">Studio Ghibli Spirits Gallery &bull; CSC 340 MVC Web App</p>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
</#macro>
