#!/bin/bash

OUTPUT_DIR="/Users/fmeeuwsen/Downloads/adventcalendar/content/days"

# Create directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

for day in {1..24}; do
    filename="$OUTPUT_DIR/day-$day.md"
    date=$(date -v2024y -v12m -v${day}d +%Y-%m-%d)
    
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

${messages[$day-1]}
EOF

    echo "Created $filename"
done

echo "✨ All 24 advent calendar files have been created! Merry Christmas! 🎄"