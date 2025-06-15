# Screenshot Tool

This script captures screenshots of the NL Buy vs Rent Calculator web application.

## Usage

```bash
./take_screenshot.sh
```

## Features

- Automatically starts a local HTTP server
- Captures full-page screenshots using Chrome headless mode
- Saves timestamped screenshots in the `screenshots/` directory
- Includes cleanup and error handling
- Provides colored terminal output

## Requirements

- Google Chrome (already installed)
- Python 3 (for HTTP server)
- Bash shell

## Output

Screenshots are saved as: `screenshots/nl-buy-vs-rent_YYYYMMDD_HHMMSS.png`

The script provides real-time feedback during the screenshot process and displays the final file location and size.