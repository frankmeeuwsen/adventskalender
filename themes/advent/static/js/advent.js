document.addEventListener('DOMContentLoaded', function () {
    const doors = document.querySelectorAll('.door');

    // Check for secret parameter
    const urlParams = new URLSearchParams(window.location.search);
    const isSecretMode = urlParams.get('secret') === 'true';

    // Set today's date, with override for secret mode
    const today = isSecretMode ? new Date('2024-12-25') : new Date();
    today.setHours(0, 0, 0, 0);

    // Create modal overlay
    const modalOverlay = document.createElement('div');
    modalOverlay.className = 'modal-overlay';
    document.body.appendChild(modalOverlay);

    // Create modal content container
    const modalContent = document.createElement('div');
    modalContent.className = 'modal-content';
    modalOverlay.appendChild(modalContent);

    // Create close button
    const closeButton = document.createElement('button');
    closeButton.className = 'modal-close';
    closeButton.innerHTML = '×';
    modalContent.appendChild(closeButton);

    // Keep track of currently open door
    let currentDoor = null;

    doors.forEach(door => {
        const dateStr = door.getAttribute('data-date');
        const doorDate = new Date(dateStr + 'T00:00:00');
        const titleElem = door.querySelector('h2');
        const dayMatch = titleElem.textContent.match(/Day (\d+)/);
        const dayNum = dayMatch ? parseInt(dayMatch[1]) : 0;
        door.setAttribute('data-day', dayNum);

        // Create decorative inner content
        const doorContent = door.querySelector('.door-content');
        const originalContent = doorContent.innerHTML;

        // Create decorative content container
        const decorativeContent = document.createElement('div');
        decorativeContent.className = 'door-decorative';
        decorativeContent.innerHTML = `
            <div class="door-inner-pattern">
                <div class="snowflake">❄️</div>
                <div class="holly">🎄</div>
                <div class="star">⭐</div>
            </div>
        `;

        // Replace original content with decorative content
        doorContent.innerHTML = '';
        doorContent.appendChild(decorativeContent);

        if (doorDate > today) {
            door.classList.add('future');
        }

        door.addEventListener('click', function (e) {
            if (doorDate <= today) {
                if (!this.classList.contains('open')) {
                    // Opening the door - show modal with original content
                    const modalContentDiv = document.createElement('div');
                    modalContentDiv.className = 'door-content';
                    modalContentDiv.innerHTML = originalContent;

                    modalContent.innerHTML = ''; // Clear previous content
                    modalContent.appendChild(closeButton);
                    modalContent.appendChild(modalContentDiv);
                    modalOverlay.classList.add('active');
                    this.classList.add('open');
                    currentDoor = this;
                } else {
                    // Clicking an open door - close it
                    this.classList.remove('open');
                    modalOverlay.classList.remove('active');
                    currentDoor = null;
                }
                e.stopPropagation();
            }
        });
    });

    // Rest of the event listeners remain the same...
    modalOverlay.addEventListener('click', function (e) {
        if (e.target === modalOverlay) {
            modalOverlay.classList.remove('active');
            if (currentDoor) {
                currentDoor.classList.remove('open');
                currentDoor = null;
            }
        }
    });

    closeButton.addEventListener('click', function () {
        modalOverlay.classList.remove('active');
        if (currentDoor) {
            currentDoor.classList.remove('open');
            currentDoor = null;
        }
    });

    document.addEventListener('keydown', function (e) {
        if (e.key === 'Escape' && modalOverlay.classList.contains('active')) {
            modalOverlay.classList.remove('active');
            if (currentDoor) {
                currentDoor.classList.remove('open');
                currentDoor = null;
            }
        }
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