function get_users(textElement) {
        fetch('users/get_all_users')
        .then(response => {
        if (!response.ok) {
            throw new Error('Error en la solicitud');
        }
        return response.json();
        })
        .then(data => {
        textElement.value = JSON.stringify(data);
        })
        .catch(error => {
        console.error('Error en la solicitud:', error);
        });
}
function changeButtonProperties() {
    var textElement = document.getElementById('json_data');
    let btnData = document.querySelector('button');
    if ( btnData.textContent == 'Exportar listado JSON' ){
        textElement.style.display = 'block';
        btnData.textContent = 'Ocultar listado JSON';
        get_users(textElement);
    }else{
        textElement.style.display = 'none';
        btnData.textContent = 'Exportar listado JSON';
    }
}