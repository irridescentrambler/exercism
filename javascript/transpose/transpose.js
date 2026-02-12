// @ts-check
/**
 * 
 * @param {String[]} input
 * @returns {Array}
 */
export const transpose = (input) => {
  if (input.length === 0) return []
  const matrix = input.map((row) => row.split(''))
  const columnCount = Math.max(...matrix.map((row) => row.length))
  const result = []
  for (let i = 0; i < columnCount; i++){
    result.push(matrix.map((row) => row[i] ?? '\0'))
  }
  return result.map((row) => cleanRow(row.join("")))
};

/**
 * 
 * @param {string} input
 * @returns {string}
 */
const cleanRow = (input) => {
  return input.replace(/\0+$/, "").replaceAll('\0', " ")
}
