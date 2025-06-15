#!/bin/bash

# Screenshot script for NL Buy vs Rent Calculator
# Takes a screenshot of the web application using Chrome headless mode

set -e

# Configuration
PORT=8080
URL="http://localhost:$PORT"
SCREENSHOT_DIR="screenshots"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
SCREENSHOT_FILE="$SCREENSHOT_DIR/nl-buy-vs-rent_$TIMESTAMP.png"

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m' # No Color

echo -e "${BLUE}🖼️  NL Buy vs Rent Calculator Screenshot Tool${NC}"
echo "=============================================="

# Create screenshots directory if it doesn't exist
mkdir -p "$SCREENSHOT_DIR"

# Function to cleanup background processes
cleanup() {
    if [ ! -z "$SERVER_PID" ]; then
        echo -e "${BLUE}🧹 Cleaning up server (PID: $SERVER_PID)...${NC}"
        kill $SERVER_PID 2>/dev/null || true
        wait $SERVER_PID 2>/dev/null || true
    fi
}

# Set trap to cleanup on exit
trap cleanup EXIT

# Start HTTP server in background
echo -e "${BLUE}🚀 Starting local HTTP server on port $PORT...${NC}"
python3 -m http.server $PORT --bind 127.0.0.1 > /dev/null 2>&1 &
SERVER_PID=$!

# Wait for server to be ready
echo -e "${BLUE}⏳ Waiting for server to be ready...${NC}"
for i in {1..10}; do
    if curl -s -o /dev/null -w "%{http_code}" "$URL" | grep -q "200"; then
        echo -e "${GREEN}✅ Server is ready!${NC}"
        break
    fi
    if [ $i -eq 10 ]; then
        echo -e "${RED}❌ Server failed to start after 10 seconds${NC}"
        exit 1
    fi
    sleep 1
done

# Take screenshot
echo -e "${BLUE}📸 Taking screenshot...${NC}"
google-chrome \
    --headless \
    --disable-gpu \
    --disable-software-rasterizer \
    --disable-dev-shm-usage \
    --no-sandbox \
    --window-size=1920,1080 \
    --screenshot="$SCREENSHOT_FILE" \
    "$URL"

# Check if screenshot was created successfully
if [ -f "$SCREENSHOT_FILE" ]; then
    echo -e "${GREEN}✅ Screenshot saved: $SCREENSHOT_FILE${NC}"
    
    # Get file size for confirmation
    FILE_SIZE=$(du -h "$SCREENSHOT_FILE" | cut -f1)
    echo -e "${GREEN}📊 File size: $FILE_SIZE${NC}"
    
    # Show the absolute path
    ABS_PATH=$(realpath "$SCREENSHOT_FILE")
    echo -e "${GREEN}📁 Full path: $ABS_PATH${NC}"
else
    echo -e "${RED}❌ Failed to create screenshot${NC}"
    exit 1
fi

echo -e "${GREEN}🎉 Screenshot completed successfully!${NC}"