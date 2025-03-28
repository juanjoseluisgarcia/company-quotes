import {createContext, useContext, useMemo, useState} from 'react';
import {createTheme, CssBaseline, ThemeProvider as MUIThemeProvider, useMediaQuery,} from '@mui/material';

const ColorModeContext = createContext({
    toggleColorMode: () => {
    },
    mode: 'light' as 'light' | 'dark',
});

export const useColorMode = () => useContext(ColorModeContext);

export function ThemeProvider({children}: { children: React.ReactNode }) {
    const prefersDark = useMediaQuery('(prefers-color-scheme: dark)');
    const [mode, setMode] = useState<'light' | 'dark'>(prefersDark ? 'dark' : 'light');

    const toggleColorMode = () => {
        setMode((prev) => (prev === 'light' ? 'dark' : 'light'));
    };

    const theme = useMemo(() => {
        return createTheme({
            palette: {
                mode,
                primary: {
                    main: '#1976d2',
                },
                secondary: {
                    main: '#ff4081',
                },
            },
            typography: {
                fontFamily: 'Inter, sans-serif',
            },
            components: {
                MuiLink: {
                    styleOverrides: {
                        root: {
                            color: '#ff4081',
                            textDecoration: 'none',
                            '&:hover': {
                                textDecoration: 'underline',
                            },
                        },
                    },
                },
            },
        });
    }, [mode]);

    return (
        <ColorModeContext.Provider value={{toggleColorMode, mode}}>
            <MUIThemeProvider theme={theme}>
                <CssBaseline/>
                {children}
            </MUIThemeProvider>
        </ColorModeContext.Provider>
    );
}