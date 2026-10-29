package com.tran.ghibli_api;

import com.tran.ghibli_api.characters.GhibliCharacter;
import com.tran.ghibli_api.characters.GhibliCharacterRepository;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.util.List;

@SpringBootApplication
public class GhibliApiApplication {

    public static void main(String[] args) {
        SpringApplication.run(GhibliApiApplication.class, args);
    }

    @Bean
    CommandLineRunner seedDatabase(GhibliCharacterRepository repository) {
        return args -> {
            if (repository.count() == 0) {
                List<GhibliCharacter> initialCharacters = List.of(
                    new GhibliCharacter(
                        "Boh & Yu-Bird",
                        "Spirited Away",
                        "Bathhouse Runaways / Companions",
                        "Transformed Giant Baby & Fly",
                        "https://i.pinimg.com/736x/8c/bb/35/8cbb3526e592b911f31cbf81bb47fb1f.jpg",
                        "Yubaba's pampered child turned into a tiny mouse alongside the harpy minion transformed into a miniature fly. Travelling with Chihiro teaches Boh courage and independence."
                    ),
                    new GhibliCharacter(
                        "Calcifer",
                        "Howl's Moving Castle",
                        "Castle Engine / Hearth Keeper",
                        "Fire Demon",
                        "https://pbs.twimg.com/media/F1uZkJaX0AEqLSB.jpg",
                        "A sarcastic fallen star bound to Howl's heart who heats the water, powers the giant moving castle, and loves eating fried eggs, bacon, and eggshells."
                    ),
                    new GhibliCharacter(
                        "Chu & Chibi Totoro",
                        "My Neighbor Totoro",
                        "Forest Keepers / Acorn Gatherers",
                        "Forest Spirits",
                        "https://i.pinimg.com/736x/26/48/64/26486468ce7828b4b717debc4df8abd4.jpg",
                        "The medium blue and small white companions of Big Totoro who scurry through the forest underbrush dropping magic acorns and playing ocarinas in the treetops."
                    ),
                    new GhibliCharacter(
                        "Otori-sama",
                        "Spirited Away",
                        "Bathhouse Guests",
                        "Duck Spirits",
                        "https://cdn11.bigcommerce.com/s-ad7c7/images/stencil/original/image-manager/studio-ghibli-ootori-sama-spirited-away-studio-brillantine-toronto-canada-6-copy.jpg?t=1716317598",
                        "Plump, giant chick-like deities who visit Yubaba's bathhouse in groups to soak peacefully in warm herbal waters with leaves resting atop their heads."
                    ),
                    new GhibliCharacter(
                        "Susuwatari (Soot Sprites)",
                        "My Neighbor Totoro & Spirited Away",
                        "Boiler Room Workers / House Spirits",
                        "Spirit (Soot Yokai)",
                        "https://i.redd.it/emjhrf4b526d1.png",
                        "Small fuzzy balls of pure soot born in dark, abandoned places who love sweet star candy (Kompeito) and carry heavy coal chunks in Kamaji's bathhouse boiler room."
                    ),
                    new GhibliCharacter(
                        "Warawara",
                        "The Boy and the Heron",
                        "Unborn Human Souls",
                        "Spirit Entities",
                        "/warawara.webp",
                        "Floating, bubble-like spirits in the underworld that feed on fish guts, inflate once mature, and float upward toward the sky to be born into the real world."
                    )
                );
                repository.saveAll(initialCharacters);
            }
        };
    }
}