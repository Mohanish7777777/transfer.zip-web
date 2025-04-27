FROM node:20-alpine

# Install extra tools if needed
RUN apk add --no-cache bash

# Set working directory
WORKDIR /app

# Copy setup scripts first
COPY setup.sh local-dev.sh ./

# Make them executable
RUN chmod +x setup.sh local-dev.sh

# Install dependencies
RUN ./setup.sh

# Copy everything else (frontend/, signaling-server/, etc.)
COPY . .

# Expose common ports
EXPOSE 3000 8000 8001 9001

# Default command: Run local dev script
CMD ["./local-dev.sh"]
