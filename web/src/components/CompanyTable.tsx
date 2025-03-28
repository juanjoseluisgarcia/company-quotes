import {
    Table,
    TableBody,
    TableCell,
    TableContainer,
    TableHead,
    TableRow,
    Paper,
    TableSortLabel,
    Link,
    useTheme,
} from "@mui/material";
import { useState } from "react";
import { Company } from "../types";

interface Props {
    companies: Company[];
}

type SortKey = keyof Company;

export default function CompanyTable({ companies }: Props) {
    const [sortBy, setSortBy] = useState<SortKey>("name");
    const [sortDirection, setSortDirection] = useState<"asc" | "desc">("asc");
    const theme = useTheme();

    const handleSort = (key: SortKey) => {
        if (sortBy === key) {
            setSortDirection(sortDirection === "asc" ? "desc" : "asc");
        } else {
            setSortBy(key);
            setSortDirection("asc");
        }
    };

    const sorted = [...companies].sort((a, b) => {
        const aValue = a[sortBy]?.toString().toLowerCase() || "";
        const bValue = b[sortBy]?.toString().toLowerCase() || "";

        if (aValue < bValue) return sortDirection === "asc" ? -1 : 1;
        if (aValue > bValue) return sortDirection === "asc" ? 1 : -1;
        return 0;
    });

    return (
        <TableContainer component={Paper}>
            <Table>
                <TableHead>
                    <TableRow>
                        {["name", "ticker", "exchange", "isin", "website"].map((key) => (
                            <TableCell key={key}>
                                <TableSortLabel
                                    active={sortBy === key}
                                    direction={sortBy === key ? sortDirection : "asc"}
                                    onClick={() => handleSort(key as SortKey)}
                                >
                                    {key.charAt(0).toUpperCase() + key.slice(1)}
                                </TableSortLabel>
                            </TableCell>
                        ))}
                    </TableRow>
                </TableHead>
                <TableBody>
                    {sorted.map((company) => (
                        <TableRow key={company.id}>
                            <TableCell>{company.name}</TableCell>
                            <TableCell>{company.ticker}</TableCell>
                            <TableCell>{company.exchange}</TableCell>
                            <TableCell>{company.isin}</TableCell>
                            <TableCell>
                                <Link
                                    href={company.website}
                                    target="_blank"
                                    rel="noopener"
                                    underline="hover"
                                    sx={{
                                        color:
                                            theme.palette.mode === "dark"
                                                ? theme.palette.primary.light
                                                : theme.palette.primary.dark,
                                        fontWeight: 500,
                                    }}
                                >
                                    {company.website}
                                </Link>
                            </TableCell>
                        </TableRow>
                    ))}
                </TableBody>
            </Table>
        </TableContainer>
    );
}