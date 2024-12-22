// Fetch the version file and display it
fetch("version")
.then(response => response.text())
.then(data => {
    document.getElementById("version").textContent = data.trim();
})
.catch(err => {
    console.error("Error fetching version:", err);
    document.getElementById("version").textContent = "Error loading version";
});