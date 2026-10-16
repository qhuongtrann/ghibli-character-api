package com.tran.ghibli_api.characters;

import jakarta.validation.Valid;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/characters")
public class GhibliCharacterController {
    private final GhibliCharacterService service;

    public GhibliCharacterController(GhibliCharacterService service) 
    {

        this.service = service;
    }

    @GetMapping
    public List<GhibliCharacter> list(

            @RequestParam(required = false)
            String name,

            @RequestParam(required = false)
            String universe) {

        return service.search(name, universe);
    }

    @GetMapping("/{id}")
    public GhibliCharacter get(@PathVariable Long id) 
    {
        return service.findById(id);
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public GhibliCharacter create(

            @Valid
            @RequestBody
            GhibliCharacter character) 
    {

        return service.create(character);
    }

    @PutMapping("/{id}")
    public GhibliCharacter update(
            @PathVariable Long id,
            @Valid
            @RequestBody
            GhibliCharacter character) 
    {
        return service.update(id, character);
    }

    @DeleteMapping("/{id}")
    @ResponseStatus(HttpStatus.NO_CONTENT)
    public void delete(@PathVariable Long id) 
    {
        service.delete(id);
    }
}