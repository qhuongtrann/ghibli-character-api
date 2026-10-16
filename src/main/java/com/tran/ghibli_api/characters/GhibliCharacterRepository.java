package com.tran.ghibli_api.characters;

import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface GhibliCharacterRepository
        extends JpaRepository<GhibliCharacter, Long> {

    List<GhibliCharacter> findByUniverseIgnoreCase(String universe);

    List<GhibliCharacter> findByNameContainingIgnoreCase(String name);

    List<GhibliCharacter>
    findByNameContainingIgnoreCaseAndUniverseIgnoreCase(
            String name,
            String universe);
}