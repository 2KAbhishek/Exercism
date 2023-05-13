export const COLORS = ["black", "brown", "red", "orange", "yellow", "green", "blue", "violet", "grey", "white"];
export const UNITS = ["", "kilo", "mega", "giga", "tera", "peta", "exa", "zetta", "yotta"];

export function decodedResistorValue(colors: string[]): string {
    let value = getValues(colors);
    const unit = UNITS[Math.floor(Math.log10(value) / 3)];
    value /= Math.pow(10, Math.floor(Math.log10(value) / 3) * 3);
    return `${value || 0} ${unit || ""}ohms`;
}

export function getValues(colors: string[]): number {
    const [first, second, third] = colors;
    return (COLORS.indexOf(first) * 10 + COLORS.indexOf(second)) * Math.pow(10, COLORS.indexOf(third));
}
