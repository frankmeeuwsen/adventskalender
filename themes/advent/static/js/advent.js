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
        door.addEventListener('click', function () {
            // Only open if it's not a future date
            if (doorDate <= today) {
                this.classList.toggle('open');
            }
        });
    });
});

document.addEventListener('DOMContentLoaded', function () {
    const calendar = document.querySelector('.advent-calendar');
    const numberOfStars = 30;

    // Create stars
    for (let i = 0; i < numberOfStars; i++) {
        const star = document.createElement('div');
        star.className = 'star';

        // Random position around the calendar
        // Using negative and >100% values to place stars outside the calendar
        const top = Math.random() * 140 - 20 + '%';  // -20% to 120%
        const left = Math.random() * 140 - 20 + '%'; // -20% to 120%

        // Random animation duration between 1.5 and 3 seconds
        const duration = 1.5 + Math.random() * 1.5 + 's';

        // Random animation delay
        const delay = Math.random() * 3 + 's';

        // Apply styles
        star.style.cssText = `
            top: ${top};
            left: ${left};
            --twinkle-duration: ${duration};
            animation-delay: ${delay};
        `;

        calendar.appendChild(star);
    }
});