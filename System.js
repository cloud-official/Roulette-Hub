// All code is wrapped in DOMContentLoaded to ensure elements exist
document.addEventListener('DOMContentLoaded', function() {
    // Copy script to clipboard
    const copyBtn = document.getElementById('copy-btn');
    if (copyBtn) {
        copyBtn.addEventListener('click', function() {
            const scriptContentElem = document.getElementById('script-content');
            if (!scriptContentElem) return;
            const scriptContent = scriptContentElem.textContent;
            const btn = this;
            if (navigator.clipboard) {
                navigator.clipboard.writeText(scriptContent).then(() => {
                    const originalText = btn.innerHTML;
                    btn.innerHTML = '<i class="fas fa-check mr-2"></i><span>Copied!</span>';
                    btn.classList.remove('bg-purple-600', 'hover:bg-purple-700');
                    btn.classList.add('bg-green-600', 'hover:bg-green-700');
                    btn.classList.remove('pulse-animation');
                    setTimeout(() => {
                        btn.innerHTML = originalText;
                        btn.classList.add('bg-purple-600', 'hover:bg-purple-700', 'pulse-animation');
                        btn.classList.remove('bg-green-600', 'hover:bg-green-700');
                    }, 2000);
                }).catch(err => {
                    console.error('Failed to copy: ', err);
                    alert('Failed to copy script. Please try again or copy manually.');
                });
            } else {
                alert('Clipboard API not supported. Please copy manually.');
            }
        });
    }

    // Update checker simulation
    const updateBtn = document.getElementById('update-btn');
    if (updateBtn) {
        updateBtn.addEventListener('click', function() {
            const btn = this;
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-circle-notch fa-spin mr-2"></i><span>Checking...</span>';
            setTimeout(() => {
                btn.innerHTML = '<i class="fas fa-check-circle mr-2"></i><span>Latest Version!</span>';
                setTimeout(() => {
                    btn.innerHTML = originalText;
                }, 2000);
            }, 1500);
        });
    }
});
