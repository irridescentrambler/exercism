class ColorBands {
  static coding = {
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9,
  };
}

export const decodedValue = (colors) => {
  const coding = ColorBands.coding
  return Number.parseInt(`${coding[colors[0]]}${coding[colors[1]]}`)
};
