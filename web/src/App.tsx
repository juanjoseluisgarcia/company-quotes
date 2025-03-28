import { useEffect, useMemo, useState } from 'react';
import { Container, Typography, CssBaseline, IconButton } from '@mui/material';
import { createTheme, ThemeProvider } from '@mui/material/styles';
import LightModeIcon from '@mui/icons-material/LightMode';
import DarkModeIcon from '@mui/icons-material/DarkMode';
import CompanyTable from './components/CompanyTable';
import { getCompanies } from './services/CompanyService';
import { Company } from './types';

function App() {
    const [mode, setMode] = useState<'light' | 'dark'>(
        window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light'
    );
    const [companies, setCompanies] = useState<Company[]>([]);

    const theme = useMemo(
        () =>
            createTheme({
                palette: {
                    mode,
                    primary: { main: mode === 'dark' ? '#90caf9' : '#1976d2' },
                },
                components: {
                    MuiLink: {
                        styleOverrides: {
                            root: {
                                color: mode === 'dark' ? '#90caf9' : '#1565c0',
                            },
                        },
                    },
                },
            }),
        [mode]
    );

    const toggleTheme = () => {
        setMode((prev) => (prev === 'light' ? 'dark' : 'light'));
    };

    useEffect(() => {
        async function fetchData() {
            try {
                const data = await getCompanies();
                setCompanies(data);
            } catch (error) {
                console.error('Failed to fetch companies:', error);
            }
        }
        fetchData();

        const listener = (e: MediaQueryListEvent) => {
            setMode(e.matches ? 'dark' : 'light');
        };
        const mediaQuery = window.matchMedia('(prefers-color-scheme: dark)');
        mediaQuery.addEventListener('change', listener);
        return () => mediaQuery.removeEventListener('change', listener);
    }, []);

    return (
        <ThemeProvider theme={theme}>
            <CssBaseline />
            <Container maxWidth="lg">
                <Typography variant="h4" gutterBottom>
                    Company List
                    <IconButton onClick={toggleTheme} sx={{ float: 'right' }}>
                        {mode === 'dark' ? <LightModeIcon /> : <DarkModeIcon />}
                    </IconButton>
                </Typography>
                <CompanyTable companies={companies} />
            </Container>
        </ThemeProvider>
    );
}

export default App;