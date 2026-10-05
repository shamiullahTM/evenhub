# Use the official Playwright image — browsers included
FROM mcr.microsoft.com/playwright:v1.58.2-noble

WORKDIR /app

# Install dependencies
COPY package.json package-lock.json ./
RUN npm ci --ignore-scripts

# Copy test files
COPY playwright.config.ts ./
COPY tests/ ./tests/

# Install Xvfb for virtual display
RUN apt-get update && apt-get install -y xvfb

# Run Playwright in headed mode with virtual display
CMD ["xvfb-run", "--auto-servernum", "--server-args=-screen 0 1920x1080x24", "npx", "playwright", "test", "--headed"]
