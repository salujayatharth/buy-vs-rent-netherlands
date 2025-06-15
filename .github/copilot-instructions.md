# GitHub Copilot Instructions for Buy vs Rent Netherlands Calculator

## Project Overview
This is a web-based financial calculator to help users in the Netherlands decide whether to buy or rent a property. The application provides interactive calculations comparing the financial outcomes of both scenarios over a specified time horizon.

## Key Financial Concepts & Dutch Terms

### Buying Scenario
- **Purchase Price**: The property acquisition cost
- **Down Payment**: Initial payment (eigen inzet)
- **Mortgage Interest Rate**: Current mortgage rate in Netherlands
- **Amortization**: Loan repayment period (typically 30 years)
- **OZB (Onroerende Zaak Belasting)**: Property tax rate
- **VvE**: Vereniging van Eigenaren (homeowners association) fees
- **Maintenance Costs**: Annual property maintenance (% of property value)
- **Property Appreciation**: Annual increase in property value
- **Tax Deduction**: Mortgage interest deduction (hypotheekrenteaftrek)

### Renting Scenario
- **Monthly Rent**: Current rental amount
- **Annual Rent Increase**: Yearly rent escalation percentage
- **Investment Return Rate**: Expected return on invested capital
- **Box 3 Tax**: Dutch wealth tax on investments above €57k threshold (vermogensrendementsheffing)

## Application Architecture

### Tech Stack
- **Frontend**: Vanilla HTML, CSS (Tailwind), JavaScript
- **Charts**: Chart.js for data visualization
- **Deployment**: GitHub Pages via static deployment

### Code Structure
- **Single Page Application**: All functionality in `index.html`
- **No build process**: Direct deployment of static files
- **Interactive Elements**: Range sliders with number inputs for all parameters
- **Real-time Calculations**: Debounced updates on input changes
- **Data Persistence**: LocalStorage for user preferences
- **Export Functionality**: CSV download of yearly breakdown

### Key Functions
- `calculateResults()`: Main calculation engine
- `getInputs()`: Collects all user input values
- `updateNetWorthChart()` & `updateDeltaChart()`: Chart rendering
- `populateYearlyTable()`: Tabular data display
- `exportToCsv()`: Data export functionality

## Coding Conventions

### Variable Naming
- Use camelCase for JavaScript variables and functions
- Use descriptive names that reflect financial concepts
- Prefix DOM elements with descriptive terms (e.g., `purchasePrice`, `monthlyRent`)

### Financial Calculations
- All monetary values stored as numbers (not formatted strings)
- Use `formatCurrency()` helper for display formatting
- Apply proper rounding for financial precision
- Consider Dutch tax brackets and deduction rules

### User Experience
- Provide tooltips for complex financial terms
- Use smooth animations for value updates
- Implement responsive design for mobile usage
- Maintain state in localStorage for user convenience

### Constants
- `BOX3_TAX_FREE_THRESHOLD`: €57,000 (approximate Dutch tax-free investment threshold)
- Default values should reflect realistic Dutch market conditions

## Code Quality Guidelines
- Keep functions focused and modular
- Use consistent error handling
- Implement proper input validation
- Maintain accessibility standards
- Follow semantic HTML structure

## Testing Considerations
- Test with realistic Dutch property prices (€300k-€800k range)
- Validate tax calculations against Dutch tax rules
- Ensure responsive behavior on mobile devices
- Test edge cases (zero down payment, high appreciation rates)

## Domain Expertise
When working with this codebase, prioritize:
1. **Financial Accuracy**: Ensure calculations reflect Dutch market reality
2. **User Experience**: Keep the interface intuitive for non-financial users
3. **Performance**: Maintain smooth real-time calculations
4. **Accessibility**: Support users with varying technical literacy
5. **Localization**: Use Dutch financial terminology where appropriate