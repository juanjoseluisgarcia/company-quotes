import axios from 'axios';

const API_URL = import.meta.env.VITE_API_URL || 'http://localhost:3000';

export async function getToken() {
    const response = await axios.post(`${API_URL}/login`);
    return response.data.token;
}

export async function getCompanies() {
    const token = await getToken();
    const response = await axios.get(`${API_URL}/api/companies`, {
        headers: {
            Authorization: `Bearer ${token}`,
        },
    });
    return response.data;
}