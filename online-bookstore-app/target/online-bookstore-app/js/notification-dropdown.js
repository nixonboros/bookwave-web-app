// Notification Bell Dropdown Toggle

document.addEventListener('DOMContentLoaded', function() {
  const bellBtn = document.getElementById('notificationBellBtn');
  const dropdown = document.getElementById('notificationDropdown');

  if (bellBtn && dropdown) {
    bellBtn.addEventListener('click', function(e) {
      e.stopPropagation();
      dropdown.classList.toggle('open');
    });

    document.addEventListener('click', function(e) {
      if (!dropdown.contains(e.target) && !bellBtn.contains(e.target)) {
        dropdown.classList.remove('open');
      }
    });
  }
}); 