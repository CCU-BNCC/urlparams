#!/data/data/com.termux/files/usr/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${RED}
     █████╗     
    ██╔══██╗    
    ███████║    
    ██╔══██║    
    ██║  ██║    
    ╚═╝  ╚═╝    
${NC}"

echo -e "${RED}=== URL Parameter Extractor ===${NC}"
read -p "Enter URL: " url

params=$(echo "$url" | cut -d'?' -f2)

if [ -z "$params" ]; then
    echo -e "${RED}No parameters found.${NC}"
    exit
fi

IFS='&' read -ra pairs <<< "$params"

echo -e "${GREEN}Found Parameters:${NC}"
for pair in "${pairs[@]}"; do
    key=$(echo "$pair" | cut -d'=' -f1)
    value=$(echo "$pair" | cut -d'=' -f2-)
    echo -e "${GREEN}$key = $value${NC}"
done
