# Ghibli Character API

This project is a Spring Boot CRUD API that stores information about Studio Ghibli side characters and spirits. Users can create, view, update, delete, and search for characters in a PostgreSQL database. The project uses Spring Data JPA, PostgreSQL (Neon), Docker, and Render.

## Character Type

The API stores information about Studio Ghibli side characters and spirits, such as Calcifer, Susuwatari (Soot Sprites), Otori-sama, and other creatures from Ghibli films.

## Entity Attributes

### GhibliCharacter

| Attribute | Type | Description |
|------------|------------|------------|
| characterId | Long | Unique ID generated automatically |
| name | String | Character name |
| description | String | Character description |
| universe | String | Movie or universe the character belongs to |
| species | String | Character species |
| role | String | Character's role in the story |

## API Endpoints

| Method | Path | Description | Success Status |
|----------|----------|----------|----------|
| GET | /api/characters | Get all characters | 200 OK |
| GET | /api/characters/{id} | Get character by ID | 200 OK |
| POST | /api/characters | Create a new character | 201 Created |
| PUT | /api/characters/{id} | Update an existing character | 200 OK |
| DELETE | /api/characters/{id} | Delete a character | 204 No Content |
| GET | /api/characters?name=value | Search characters by name | 200 OK |
| GET | /api/characters?universe=value | Search characters by universe | 200 OK |

## Example POST Request

```json
{
  "name": "Calcifer",
  "description": "Fire demon who powers Howl's castle",
  "universe": "Howl's Moving Castle",
  "species": "Fire Demon",
  "role": "Castle Engine"
}
```

## Example PUT Request

```json
{
  "name": "Calcifer",
  "description": "Powerful magical fire demon",
  "universe": "Howl's Moving Castle",
  "species": "Fire Demon",
  "role": "Magic Companion"
}
```

## Deployed API

https://ghibli-character-api.onrender.com/api/characters

## Cold-Start Note

This project is deployed using Render's free tier. If the service has been idle, the first request may take up to a minute to respond while the application wakes up.