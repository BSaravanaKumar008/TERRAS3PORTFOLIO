// Smooth scrolling
document.querySelectorAll('nav ul li a').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        e.preventDefault();

        const targetId = this.getAttribute('href').substring(1);
        const targetElement = document.getElementById(targetId);

        window.scrollTo({
            top: targetElement.offsetTop - 50,
            behavior: 'smooth'
        });
    });
});

// Dark mode toggle
const darkModeToggle = document.getElementById('darkModeToggle');
darkModeToggle.addEventListener('click', () => {
    document.body.classList.toggle('dark-mode');
});

// Toggle project details
document.querySelectorAll('.project h3').forEach(projectTitle => {
    projectTitle.addEventListener('click', () => {
        const projectDetails = projectTitle.nextElementSibling;
        projectDetails.style.display = projectDetails.style.display === 'none' ? 'block' : 'none';
    });
});

// Initially hide all project details
document.querySelectorAll('.project p').forEach(projectDetail => {
    projectDetail.style.display = 'none';
});
