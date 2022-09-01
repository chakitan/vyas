fetch('../assets/settings.json')
    .then((response) => response.json())
    .then((json) => console.log(json));