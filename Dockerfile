FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    golang \
    rustc \
    python3 \
    curl \
    && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /opt/naab-passage

# Copy project files
COPY . .

# Build NAAb
RUN bash build.sh

# Create bin directory for compiled workers
RUN mkdir -p bin

# Expose gateway port
EXPOSE 8091

# Run gateway
CMD ["/opt/naab-passage/naab/build/naab-lang", "/opt/naab-passage/main.naab"]
