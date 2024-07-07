async function fetchProtectedData(url) {
    const token = localStorage.getItem('token');
    if (!token) {
        console.error('No token found');
        return;
    }

    try {
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`
            }
        });

        const result = await response.json();
        if (response.ok) {
            console.log('Datos protegidos:', result);
        } else {
            console.error('Error al obtener datos protegidos:', result.error);
        }
    } catch (error) {
        console.error('Error en la solicitud:', error);
    }
}

fetchProtectedData('/movies');
fetchProtectedData('/users');