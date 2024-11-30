#!/bin/bash

OUTPUT_DIR="/Users/fmeeuwsen/Downloads/adventcalendar/content/days"

# Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

for day in {1..24}; do
    filename="$OUTPUT_DIR/day-$day.md"
    date=$(date -v2024y -v12m -v${day}d +%Y-%m-%d)
    
    dutch_messages=(
        "🎄 AI-tip voor vandaag: Laat AI je helpen met het plannen van je kerstavondmaal! 🍽️"
        "🎅 Gebruik AI om persoonlijke kerstwensen te verzenden naar je familie en vrienden! 🎁"
        "⛄ Leuk feit: AI kan je helpen met het vinden van de beste kerstmarkten in 2025! 🎄"
        "🎄 AI-assistent: Ontdek de perfecte kerstcadeaus met behulp van AI! 🎁"
        "🦌 Laat AI je helpen met het organiseren van je kerstfeestjes! 🎉"
        "🎁 Maak unieke kerstkaarten met AI-gegenereerde afbeeldingen! 🎨"
        "❄️ AI kan je helpen met het plannen van je winkelroute voor kerstcadeaus! 🛍️"
        "🎅 Tip van vandaag: Gebruik AI om kerstquizzen te maken voor gezellige avonden! 🎮"
        "🎄 Laat AI je helpen met het samenstellen van een kerstmuziekplaylist! 🎵"
        "⛄ AI-vertalingstools kunnen je helpen om kerstgroeten in verschillende talen te verzenden! 🌍"
        "🎁 Gebruik AI om een perfecte kerstdecoratie voor je huis te ontwerpen! 🏠"
        "🦌 AI kan je helpen met het volgen van de Kerstman op kerstavond! 🗺️"
        "🎄 Genereer festieve kleuren voor je kerstdecoraties met AI! 🎨"
        "🎅 Laat AI je helpen met het plannen van een gezonde kerstmaaltijd! 🍽️"
        "❄️ Gebruik AI om sprookjes te schrijven voor de kinderen tijdens de kerstdagen! 📚"
        "🎁 AI kan je helpen met het beheren van je kerstbudget! 💰"
        "⛄ Creëer unieke sneeuwvlokpatronen met AI voor je kersthandwerken! ❄️"
        "🎄 Laat AI je helpen met het vinden van leuke kerstactiviteiten in jouw buurt! ⛄"
        "🦌 Gebruik AI om festieve e-mailberichten te schrijven voor je contacten! 📧"
        "🎅 AI kan je helpen met het stellen van realistische Nieuwjaarsvoornemens! 🎯"
        "❄️ Genereer unieke kerstboomversieringen met AI! 🎄"
        "🎁 Maak een kerstmuziekplaylist met AI op basis van je muzieksmaak! 🎵"
        "⛄ Laat AI je helpen met het schrijven van dankbetuigingen voor je kerstcadeaus! ✍️"
        "🎄 Sluit het jaar 2025 af met AI: Ontdek hoe AI je kan helpen in het nieuwe jaar! 🌟"
    )


    # Array of festive AI messages
    messages=(
        "🎄 Today's AI tip: Let ChatGPT help you write personalized holiday greetings for your loved ones! ❄️"
        "🎅 Use AI to generate creative gift ideas based on your friends' interests! 🎁"
        "⛄ Fun fact: AI can help compose holiday music! Time to create your own Christmas carol? 🎵"
        "🎄 AI cooking assistant: Perfect your holiday recipes with smart kitchen tips! 🍪"
        "🦌 Let AI help you plan the perfect holiday party schedule! ✨"
        "🎁 Use image generation AI to create unique holiday cards! 🎨"
        "❄️ AI can help optimize your gift shopping route for maximum efficiency! 🛍️"
        "🎅 Today's tip: Use AI to generate fun holiday-themed riddles for family games! 🎮"
        "🎄 Let AI help you craft the perfect holiday movie watchlist! 🎬"
        "⛄ AI translation tools can help you say 'Merry Christmas' in many languages! 🌍"
        "🎁 Use AI to create a custom holiday decoration layout for your home! 🏠"
        "🦌 AI can help track Santa's route - time to code your own Santa tracker? 🗺️"
        "🎄 Generate festive color palettes with AI for your holiday decorations! 🎨"
        "🎅 Let AI assist in creating a balanced holiday meal plan! 🍽️"
        "❄️ Use AI to write whimsical holiday stories for the little ones! 📚"
        "🎁 AI can help organize your holiday budget and gift expenses! 💰"
        "⛄ Create AI-generated snowflake patterns for crafting! ❄️"
        "🎄 Let AI suggest holiday activities based on the weather forecast! ⛄"
        "🦌 Use AI to compose festive email auto-replies for your holiday break! 📧"
        "🎅 AI can help plan your New Year's resolutions with smart goal-setting! 🎯"
        "❄️ Generate unique Christmas tree decoration themes with AI! 🎄"
        "🎁 Use AI to create a holiday music playlist based on your taste! 🎵"
        "⛄ Let AI help you write thank-you notes for your holiday gifts! ✍️"
        "🎄 As we close our AI advent calendar, remember: AI is like holiday magic - use it wisely and creatively! 🌟"
    )


    # Create markdown file with YAML front matter and message
    cat > "$filename" << EOF
---
title: "Day $day"
date: $date
draft: false
---

${dutch_messages[$day-1]}
EOF

    echo "Created $filename"
done

echo "✨ All 24 advent calendar files have been created! Merry Christmas! 🎄"