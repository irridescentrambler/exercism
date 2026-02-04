export function countNucleotides(strand) {
  const tally = {
    A: 0,
    C: 0,
    G: 0,
    T: 0
  }
  for (const char of strand){
    if(!(char in tally)){
      throw new Error("Invalid nucleotide in strand")
    }
    tally[char] += 1
  }
  return Object.values(tally).join(" ")
}
