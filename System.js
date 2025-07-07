        document.getElementById('copy-btn').addEventListener('click', function() {
            const scriptContent = document.getElementById('script-content').textContent;
            navigator.clipboard.writeText(scriptContent).then(() => {
                const originalText = this.innerHTML;
                this.innerHTML = '<i class="fas fa-check mr-2"></i><span>Copied!</span>';
                this.classList.remove('bg-purple-600', 'hover:bg-purple-700');
                this.classList.add('bg-green-600', 'hover:bg-green-700');
                this.classList.remove('pulse-animation');
                
                setTimeout(() => {
                    this.innerHTML = originalText;
                    this.classList.add('bg-purple-600', 'hover:bg-purple-700', 'pulse-animation');
                    this.classList.remove('bg-green-600', 'hover:bg-green-700');
                }, 2000);
            }).catch(err => {
                console.error('Failed to copy: ', err);
                alert('Failed to copy script. Please try again or copy manually.');
            });
        });

        // Update checker simulation
        document.querySelectorAll('button')[1].addEventListener('click', function() {
            const originalText = this.innerHTML;
            this.innerHTML = '<i class="fas fa-circle-notch fa-spin mr-2"></i><span>Checking...</span>';
            
            setTimeout(() => {
                this.innerHTML = '<i class="fas fa-check-circle mr-2"></i><span>Latest Version!</span>';
                setTimeout(() => {
                    this.innerHTML = originalText;
                }, 2000);
            }, 1500);
        });
    </script>
</body>
