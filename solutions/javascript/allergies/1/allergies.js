const allergies = {
  'eggs': 1,
  'peanuts': 2,
  'shellfish': 4,
  'strawberries': 8,
  'tomatoes': 16,
  'chocolate': 32,
  'pollen': 64,
  'cats': 128
}

export class Allergies {
  constructor(score) {
    this.score = score
  }

  list() {
    return Object.entries(allergies)
      .filter(([, value]) => (this.score & value) === value)
      .map(([key]) => key)
  }

  allergicTo(foodItem) {
    const value = allergies[foodItem]
    return (this.score & value) === value
  }
}
