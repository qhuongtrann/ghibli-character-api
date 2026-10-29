# Studio Ghibli Spirits Gallery & CRUD API

A full-stack Spring Boot MVC web application and RESTful API showcasing lesser-known spirits and side creatures from Studio Ghibli films. Built with Java 25, Spring Boot, FreeMarker, Spring Data JPA, PostgreSQL (Neon), and deployed with Docker on Render.

## Live Deployment
- **Live Web App (Gallery Home):** `https://ghibli-character-api.onrender.com/`
- **Live REST API:** `https://ghibli-character-api.onrender.com/api/characters`
> **Note on Cold Starts:** This application is hosted on Render's free tier, which puts idle services to sleep. The first request may take up to 60 seconds to wake up the server.

---

## Entity Attributes (`GhibliCharacter`)

| Attribute | Type | Rules / Description |
| :--- | :--- | :--- |
| `characterId` | `Long` | Primary Key, auto-generated (`IDENTITY`) |
| `name` | `String` | **Required** (`@NotBlank`) — Name of the spirit/character |
| `description` | `String` | **Required** (`@NotBlank`) — Lore and backstory |
| `universe` | `String` | Optional — Movie title / Ghibli universe |
| `role` | `String` | Optional — Role in the story |
| `species` | `String` | Optional — Spirit classification / species |
| `imageUrl` | `String` | Optional — URL or static path to the character's image |

---

## Web App Pages (FreeMarker MVC)

| Method | Route | Description |
| :--- | :--- | :--- |
| `GET` | `/` or `/characters` | Gallery page displaying all characters as cards, with name search and universe filter |
| `GET` | `/characters/{id}` | Character details page showing full lore, attributes, Edit button, and Delete button |
| `GET` | `/about` | About page explaining the gallery theme and Spring Boot MVC layered architecture |
| `GET` | `/characters/new` | Form page to add a new Studio Ghibli spirit |
| `POST` | `/characters` | Validates and saves a new character, then redirects to `/` with a flash message |
| `GET` | `/characters/{id}/edit` | Pre-filled form page to edit an existing character |
| `POST` | `/characters/{id}/edit` | Validates and updates the character, then redirects to `/characters/{id}` |
| `POST` | `/characters/{id}/delete` | Deletes the character after confirmation and redirects to `/` |

---

## REST API Endpoints (`/api/characters`)

| Purpose | Method & Path | Success Status | Error Status |
| :--- | :--- | :--- | :--- |
| Get all characters | `GET /api/characters` | `200 OK` | — |
| Filter by universe | `GET /api/characters?universe=Spirited Away` | `200 OK` | — |
| Search by name | `GET /api/characters?name=calcifer` | `200 OK` | — |
| Get one character | `GET /api/characters/{id}` | `200 OK` | `404 Not Found` |
| Add a character | `POST /api/characters` | `201 Created` | `400 Bad Request` |
| Update a character | `PUT /api/characters/{id}` | `200 OK` | `400` / `404` |
| Delete a character | `DELETE /api/characters/{id}` | `204 No Content` | `404 Not Found` |

### Example JSON Request Body (`POST` / `PUT`)
```json
{
  "name": "Kodama",
  "universe": "Princess Mononoke",
  "role": "Sign of a healthy forest",
  "species": "Tree Spirits",
  "imageUrl": "[https://placehold.co/400x500](https://placehold.co/400x500)",
  "description": "Small pale forest spirits that rattle their heads curiously and guide travelers through the ancient woods."
}