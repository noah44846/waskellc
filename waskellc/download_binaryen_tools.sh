# Download tar.gz file from https://github.com/WebAssembly/binaryen/releases for the correct os and architecture
# and extract it to the correct directory

# Usage: ./download_binaryen_tools.sh

# Get the os and architecture
os=$(uname -s | tr '[:upper:]' '[:lower:]')
arch=$(uname -m)

# If os is darwin, change it to macos
if [ $os == "darwin" ]; then
  os="macos"
fi

# Download version 117 of binaryen
wget https://github.com/WebAssembly/binaryen/releases/download/version_117/binaryen-version_117-${arch}-${os}.tar.gz

# Extract the tar.gz file
tar -xf binaryen-version_117-${arch}-${os}.tar.gz

# Remove the tar.gz file
rm binaryen-version_117-${arch}-${os}.tar.gz

# remove the old binaryen-tools directory and create a new one
rm -rf binaryen-tools
mkdir -p binaryen-tools/${arch}/${os}/bin
mkdir -p binaryen-tools/${arch}/${os}/lib

# Move the binaryen directory to the correct location
mv binaryen-version_117/bin/wasm-opt binaryen-version_117/bin/wasm-merge binaryen-tools/${arch}/${os}/bin
mv binaryen-version_117/lib/* binaryen-tools/${arch}/${os}/lib

# Remove the binaryen directory
rm -rf binaryen-version_117

# Add execute permissions to the binaries
chmod +x binaryen-tools/${arch}/${os}/bin/*
