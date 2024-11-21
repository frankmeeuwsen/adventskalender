# AI Advent Calendar Documentation

This document contains all the key components and code snippets used to build the AI-themed advent calendar.

## Table of Contents
1. [Content Generation](#1-content-generation)
2. [Door Functionality](#2-door-functionality)
3. [Styling](#3-styling)
4. [Deployment](#4-deployment)

## 1. Content Generation

### Bash Script for Markdown Files
This script generates 24 markdown files with AI-themed content:

```bash
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
        # ... [other messages]
        "🎄 As we close our AI advent calendar, remember: AI is like holiday magic - use it wisely and creatively! 🌟"
    )
    
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
```

## 2. Door Functionality

### Main JavaScript (advent.js)
Handles door opening/closing and date validation:

```javascript
document.addEventListener('DOMContentLoaded', function () {
    const doors = document.querySelectorAll('.door');
    const today = new Date();
    today.setHours(0, 0, 0, 0);  // Reset time part for fair comparison

    doors.forEach(door => {
        // Get the date from data-date and parse it properly
        const dateStr = door.getAttribute('data-date');
        const doorDate = new Date(dateStr + 'T00:00:00');
        
        // Extract day number from the title for the door display
        const titleElem = door.querySelector('h2');
        const dayMatch = titleElem.textContent.match(/Day (\d+)/);
        const dayNum = dayMatch ? parseInt(dayMatch[1]) : 0;

        // Set data-day for the CSS to display the number
        door.setAttribute('data-day', dayNum);

        // Mark future days
        if (doorDate > today) {
            door.classList.add('future');
        }

        // Add click handler
        door.addEventListener('click', function() {
            // Only open if it's not a future date
            if (doorDate <= today) {
                this.classList.toggle('open');
            }
        });
    });
});
```

## 3. Styling

### Main CSS (advent.css)
Includes calendar layout, door styling, animations, and decorative elements:

```css
.advent-calendar {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    padding: 20px;
    max-width: 1000px;
    margin: 0 auto;
    background: #2c5530;  /* Christmas green background */
    border-radius: 12px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
    position: relative;
}

.door {
    aspect-ratio: 1;
    perspective: 1000px;
    position: relative;
    z-index: 1;
    transition: z-index 0s 0.6s;
}

.door.open {
    z-index: 100;
    transition: z-index 0s 0s;
}

/* Door face */
.door::before {
    content: attr(data-day);
    position: absolute;
    z-index: 2;
    background: #c41e3a;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2em;
    font-weight: bold;
    color: #fff;
    border-radius: 8px;
    box-shadow: 
        inset 2px 2px 2px rgba(255, 255, 255, 0.2),
        inset -2px -2px 2px rgba(0, 0, 0, 0.2),
        0 4px 8px rgba(0, 0, 0, 0.3);
    border: 2px solid #8b0000;
    cursor: pointer;
    transition: background-color 0.3s;
    backface-visibility: visible;
}

/* Twinkling stars */
.star {
    position: absolute;
    width: 6px;
    height: 6px;
    background: #fff;
    border-radius: 50%;
    animation: twinkle var(--twinkle-duration) ease-in-out infinite;
    opacity: 0;
    z-index: 200;
    pointer-events: none;
}

@keyframes twinkle {
    0%, 100% { opacity: 0; transform: scale(1); }
    50% { opacity: 0.8; transform: scale(1.2); }
}
```

## 4. Deployment

### GitHub Actions Workflow (.github/workflows/hugo.yml)
Handles automatic building and deployment:

```yaml
name: Deploy Hugo site to Pages

on:
  push:
    branches: ["main"]
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: "pages"
  cancel-in-progress: false

defaults:
  run:
    shell: bash

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout
        uses: actions/checkout@v4
      
      - name: Setup Hugo
        uses: peaceiris/actions-hugo@v2
        with:
          hugo-version: 'latest'
          extended: true
      
      - name: Build with Hugo
        run: hugo --minify
        
      - name: Upload artifact
        uses: actions/upload-pages-artifact@v2
        with:
          path: ./public

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v2
```

### Custom Domain Setup
1. Add CNAME file in `static` folder with your domain
2. Configure DNS:
   - For subdomain: CNAME record pointing to `yourusername.github.io`
   - For apex domain: A records pointing to GitHub Pages IPs
3. Update Hugo config with correct baseURL

## Troubleshooting

Common issues and solutions:
1. If CSS/JS don't load, check the baseURL in Hugo config
2. For door animation issues, verify z-index hierarchy
3. For deployment issues, ensure GitHub Pages is enabled in repository settings
4. For DNS issues, allow up to 48 hours for propagation

## Future Enhancements
Possible improvements:
1. Add sound effects for door opening
2. Implement snow animation
3. Add more interactive elements
4. Optimize for mobile devices

