console.log("JS LOADED");

window.onload = function() {
    fetch('/actions')
        .then(res => res.json())
        .then(actions => {
            const dropdown = document.getElementById("action");

            dropdown.innerHTML = ""; // clear old options

            actions.forEach(a => {
                const option = document.createElement("option");
                option.value = a;
                option.textContent = a.replaceAll("_", " "); // nicer display
                dropdown.appendChild(option);
            });
        });
};

function runevaluate() {

    console.log("BUTTON CLICKED");  // ADD THIS

    const action = document.getElementById("action").value;

    console.log("Selected action:", action);

    fetch(`/evaluate?action=${action}`)
        .then(response => response.json())
        .then(data => {
            console.log("API Response:", data);
            displayResults(data);
        })
        .catch(error => {
            console.error("Fetch Error:", error);
            
        });
}

function displayResults(result) {
    const container = document.getElementById("cards");

    if (!container) {
        console.error("Cards container not found!");
        return;
    }

    if (!result.judge || !result.citizen || !result.utilitarian) {
        container.innerHTML = "<p style='color:red;'>Error loading results</p>";
        return;
    }

    container.innerHTML = `
        <div class="card judge">
            <div class="title">⚖️ Judge</div>
            <div class="decision">${result.judge[0]}</div>
            <div class="reason">${result.judge[1]}</div>
        </div>

        <div class="card citizen">
            <div class="title">👤 Citizen</div>
            <div class="decision">${result.citizen[0]}</div>
            <div class="reason">${result.citizen[1]}</div>
        </div>

        <div class="card utilitarian">
            <div class="title">📊 Utilitarian</div>
            <div class="decision">${result.utilitarian[0]}</div>
            <div class="reason">${result.utilitarian[1]}</div>
        </div>
    `;
}