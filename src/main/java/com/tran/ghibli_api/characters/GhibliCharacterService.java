package com.tran.ghibli_api.characters;

import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GhibliCharacterService {

    private final GhibliCharacterRepository repository;

    public GhibliCharacterService(GhibliCharacterRepository repository) {
        this.repository = repository;
    }

    public List<GhibliCharacter> search(String name, String universe) {
        boolean hasName = name != null && !name.isBlank();
        boolean hasUniverse = universe != null && !universe.isBlank();

        if (hasName && hasUniverse) {
            return repository.findByNameContainingIgnoreCaseAndUniverseIgnoreCase(name.trim(), universe.trim());
        }

        if (hasName) {
            return repository.findByNameContainingIgnoreCase(name.trim());
        }

        if (hasUniverse) {
            return repository.findByUniverseIgnoreCase(universe.trim());
        }

        return repository.findAll();
    }

    public GhibliCharacter findById(Long id) {
        return repository.findById(id).orElseThrow(() -> new CharacterNotFoundException(id));
    }

    public GhibliCharacter create(GhibliCharacter character) {
        return repository.save(character);
    }

    public GhibliCharacter update(Long id, GhibliCharacter updated) {
        GhibliCharacter existing = findById(id);

        existing.setName(updated.getName());
        existing.setDescription(updated.getDescription());
        existing.setUniverse(updated.getUniverse());
        existing.setSpecies(updated.getSpecies());
        existing.setRole(updated.getRole());
        existing.setImageUrl(updated.getImageUrl());

        return repository.save(existing);
    }

    public void delete(Long id) {
        findById(id);
        repository.deleteById(id);
    }
}