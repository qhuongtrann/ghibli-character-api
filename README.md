# Ghibli Character API

This project is a CRUD API built with Spring Boot that stores information about Studio Ghibli side characters and spirits. It allows users to create, view, update, delete, and search for characters in a PostgreSQL database.

## Technologies Used

- Java 25
- Spring Boot
- Spring Data JPA
- PostgreSQL (Neon)
- Docker
- Render
- Maven
- Postman

## Character Attributes

Each character record includes:

- characterId
- name
- description
- universe
- species
- role

## API Endpoints

### Get all characters

GET

/api/characters

### Get a character by ID

GET

/api/characters/{id}

### Create a new character

POST

/api/characters

Example:

```json
{
  "name": "Calcifer",
  "description": "Fire demon who powers Howl's castle",
  "universe": "Howl's Moving Castle",
  "species": "Fire Demon",
  "role": "Castle Engine"
}
```

### Update a character

PUT

/api/characters/{id}

Example:

```json
{
  "name": "Calcifer",
  "description": "Powerful magical fire demon",
  "universe": "Howl's Moving Castle",
  "species": "Fire Demon",
  "role": "Magic Companion"
}
```

### Delete a character

DELETE

/api/characters/{id}

### Search by name

GET

/api/characters?name=calc

### Search by universe

GET

/api/characters?universe=Howl's Moving Castle

## Running the Project Locally

Windows:

```bash
.\mvnw.cmd spring-boot:run
```

Mac/Linux:

```bash
./mvnw spring-boot:run
```

## Deployment

https://ghibli-character-api.onrender.com/api/characters

## About This Project

I chose Studio Ghibli side characters as the theme for this project because many of the smaller creatures and spirits 