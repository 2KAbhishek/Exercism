const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];
const UNITS = ["", "kilo", "mega", "giga", "tera", "peta", "exa", "zetta", "yotta"];

export function decodedResistorValue(colors: string[]): string {
    let value = getValues(colors);
    const unit = getUnit(value);
    value = adjustValue(value);
    return `${value}${unit}`;
}

function getUnit(value: number): string {
    return ` ${UNITS[Math.floor(Math.log10(value) / 3)] || ""}ohms`;
}

function adjustValue(value: number): number {
    value /= Math.pow(10, Math.floor(Math.log10(value) / 3) * 3);
    return (value || 0);
}

function getValues(colors: string[]): number {
    const [first, second, third] = colors;
    return (COLORS.indexOf(first) * 10 + COLORS.indexOf(second)) * Math.pow(10, COLORS.indexOf(third));
}
