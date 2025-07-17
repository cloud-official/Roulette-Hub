// Mobile menu functionality
        document.getElementById('mobile-menu-btn').addEventListener('click', function() {
            document.getElementById('mobile-menu').classList.remove('hidden');
            document.body.style.overflow = 'hidden';
        });
        
        document.getElementById('close-menu-btn').addEventListener('click', closeMobileMenu);
        
        function closeMobileMenu() {
            document.getElementById('mobile-menu').classList.add('hidden');
            document.body.style.overflow = '';
        }
        
        // Copy script functionality
        document.getElementById('copy-btn').addEventListener('click', function() {
            const code = document.getElementById('script-code').textContent;
            navigator.clipboard.writeText(code).then(() => {
                const btn = document.getElementById('copy-btn');
                btn.innerHTML = '<i class="fas fa-check mr-1"></i> Copied!';
                btn.classList.add('copied');
                setTimeout(() => {
                    btn.innerHTML = '<i class="fas fa-copy mr-1"></i> Copy';
                    btn.classList.remove('copied');
                }, 2000);
            });
        });
        
        // Copy key functionality
        document.getElementById('copy-key-btn').addEventListener('click', function() {
            const key = "RUSSIAN-ROULETTE-KEY(00999286124)";
            navigator.clipboard.writeText(key).then(() => {
                const btn = document.getElementById('copy-key-btn');
                btn.innerHTML = '<i class="fas fa-check mr-1"></i> Copied!';
                btn.classList.add('copied');
                setTimeout(() => {
                    btn.innerHTML = '<i class="fas fa-copy mr-1"></i> Copy';
                    btn.classList.remove('copied');
                }, 2000);
            });
        });
        
        // Smooth scrolling for anchor links
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
        
        // Animated counter for stats
        function animateCounter(elementId, target, duration = 2000) {
            const element = document.getElementById(elementId);
            const start = 0;
            const increment = target / (duration / 16);
            let current = start;
            
            const timer = setInterval(() => {
                current += increment;
                if (current >= target) {
                    clearInterval(timer);
                    current = target;
                }
                
                if (elementId === 'uptime-count') {
                    element.textContent = Math.floor(current) + '%';
                } else {
                    element.textContent = Math.floor(current);
                }
            }, 16);
        }
        
        // Initialize counters when stats section is in view
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateCounter('user-count', 24786);
                    animateCounter('game-count', 18);
                    animateCounter('update-count', 12);
                    animateCounter('uptime-count', 99.9);
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.5 });
        
        observer.observe(document.getElementById('stats'));
        
        // FAQ toggle functionality
        function toggleFAQ(id) {
            const content = document.getElementById(id + '-content');
            const icon = document.getElementById(id + '-icon');
            
            content.classList.toggle('hidden');
            icon.classList.toggle('rotate-180');
        }
        
        // Preview button functionality
        document.querySelector('.preview-overlay button').addEventListener('click', function() {
            // In a real implementation, this would open a modal with video preview
            alert('Loading script preview...');
        });
        
        // Add typing animation for h1
        document.addEventListener('DOMContentLoaded', function() {
            setTimeout(() => {
                document.querySelector('.typewriter').style.borderRight = 'none';
            }, 3500);
        });
