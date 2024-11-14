// calculateOverallOutcome
//
// Calculates the overall complaint outcome from a list of outcomes.
// Parameters:
//  outcomes - List of strings representing outcomes (may include nulls).
// Returns:
//  String that represents the calculated overall outcome (may be empty).
const calculateOverallOutcome = (outcomes) => {
    if (outcomes.length === 0) {
      return "";
    }
  
    // Remove empty outcomes - they do not affect the overall outcome calculation.
    let nonEmptyList = outcomes.filter((x) => x !== null && x !== "");
    if (nonEmptyList.length === 0) {
      return "";
    }
  
    const allWithdrawn = nonEmptyList.every((x) => x === "Withdrawn");
    if (allWithdrawn) {
      return "Withdrawn";
    }
  
    // Remove any Withdrawn outcomes - they do not affect the overall outcome calculation.
    let filteredList = nonEmptyList.filter((x) => x !== "Withdrawn");
  
    const allEqual = filteredList.every((x) => x === filteredList[0]);
    if (allEqual) {
      return filteredList[0];
    }
  
    let upheld = filteredList.includes("Upheld");
    let notUpheld = filteredList.includes("Not Upheld");
    let partiallyUpheld = filteredList.includes("Partially Upheld");
    let outOfJurisdiction = filteredList.includes("Out of Jurisdiction");
  
    if (upheld && (notUpheld || partiallyUpheld || outOfJurisdiction)) {
      return "Partially Upheld";
    }
  
    if (
      partiallyUpheld &&
      (upheld || notUpheld || partiallyUpheld || outOfJurisdiction)
    ) {
      return "Partially Upheld";
    }
  
    if ((notUpheld || outOfJurisdiction) && (!upheld || !partiallyUpheld)) {
      return "Not Upheld";
    }

    return "";
  };
  
  export { calculateOverallOutcome };