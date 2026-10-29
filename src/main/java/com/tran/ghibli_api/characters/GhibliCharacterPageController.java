package com.tran.ghibli_api.characters;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.validation.Valid;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Controller
public class GhibliCharacterPageController {

    private final GhibliCharacterService service;

    public GhibliCharacterPageController(GhibliCharacterService service) {
        this.service = service;
    }

    @GetMapping({"/", "/characters"})
    public String gallery(
            @RequestParam(required = false) String name,
            @RequestParam(required = false) String universe,
            Model model) {

        List<GhibliCharacter> characters = service.search(name, universe);
        model.addAttribute("characters", characters);
        model.addAttribute("searchName", name != null ? name : "");
        model.addAttribute("selectedUniverse", universe != null ? universe : "");
        return "gallery";
    }

    @GetMapping("/characters/{id}")
    public String details(@PathVariable Long id, Model model) {
        GhibliCharacter character = service.findById(id);
        model.addAttribute("character", character);
        return "details";
    }

    @GetMapping("/about")
    public String about() {
        return "about";
    }

    @GetMapping("/characters/new")
    public String showAddForm(Model model) {
        model.addAttribute("character", new GhibliCharacter());
        model.addAttribute("isEdit", false);
        return "character-form";
    }

    @PostMapping("/characters")
    public String createCharacter(
            @Valid @ModelAttribute("character") GhibliCharacter character,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletResponse response) {

        if (bindingResult.hasErrors()) {
            response.setStatus(HttpStatus.BAD_REQUEST.value());
            model.addAttribute("isEdit", false);
            model.addAttribute("errorMessage", "Please fill in both Name and Description.");
            return "character-form";
        }

        service.create(character);
        redirectAttributes.addFlashAttribute("successMessage", character.getName() + " was added");
        return "redirect:/";
    }

    @GetMapping("/characters/{id}/edit")
    public String showEditForm(@PathVariable Long id, Model model) {
        GhibliCharacter character = service.findById(id);
        model.addAttribute("character", character);
        model.addAttribute("isEdit", true);
        return "character-form";
    }

    @PostMapping("/characters/{id}/edit")
    public String updateCharacter(
            @PathVariable Long id,
            @Valid @ModelAttribute("character") GhibliCharacter character,
            BindingResult bindingResult,
            Model model,
            RedirectAttributes redirectAttributes,
            HttpServletResponse response) {

        if (bindingResult.hasErrors()) {
            response.setStatus(HttpStatus.BAD_REQUEST.value());
            character.setCharacterId(id);
            model.addAttribute("isEdit", true);
            model.addAttribute("errorMessage", "Please fill in both Name and Description.");
            return "character-form";
        }

        GhibliCharacter updated = service.update(id, character);
        redirectAttributes.addFlashAttribute("successMessage", updated.getName() + " was updated");
        return "redirect:/characters/" + id;
    }

    @PostMapping("/characters/{id}/delete")
    public String deleteCharacter(@PathVariable Long id, RedirectAttributes redirectAttributes) {
        GhibliCharacter character = service.findById(id);
        String name = character.getName();
        service.delete(id);
        redirectAttributes.addFlashAttribute("successMessage", name + " was removed");
        return "redirect:/";
    }

    @ExceptionHandler(CharacterNotFoundException.class)
    @ResponseStatus(HttpStatus.NOT_FOUND)
    public String handleNotFound(CharacterNotFoundException ex, Model model) {
        model.addAttribute("errorMessage", ex.getMessage());
        return "not-found";
    }
}