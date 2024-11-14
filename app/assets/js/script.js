document.addEventListener("DOMContentLoaded", function () {
    var map = L.map('map').setView([0, 0], 2);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '&copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors'
    }).addTo(map);

    var vehicles = JSON.parse(document.getElementById('datos-vehiculo').textContent);

    vehicles.forEach(function (vehicle) {
        if (vehicle.latest_location) {
            var marker = L.marker([vehicle.latest_location.latitude, vehicle.latest_location.longitude]).addTo(map);
            marker.bindPopup(`<b>Vehiculo: </b> ${vehicle.identifier}<br><b>Ultima ubicacion: </b> ${vehicle.latest_location.latitude}, ${vehicle.latest_location.longitude}`);
        }
    });
});