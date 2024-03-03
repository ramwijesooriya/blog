// add.js
function validatePostForm() {
    var title = document.getElementById('title').value;
    var content = document.getElementById('content').value;

    if (title.trim() === '' || content.trim() === '') {
        alert('Title and content are required.');
        return false;
    }

    return true;
}