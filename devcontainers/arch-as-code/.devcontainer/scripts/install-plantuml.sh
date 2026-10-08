#!/bin/bash

# Create a temporary directory for downloading the latest release
temp_dir=$(mktemp -d)

# Download the latest release of PlantUML from GitHub
curl -s https://api.github.com/repos/plantuml/plantuml/releases/latest \
| grep "browser_download_url.*jar" \
| cut -d : -f 2,3 \
| tr -d \" \
| wget -P $temp_dir -qi -

# Move the downloaded jar file to /usr/local/bin and rename it to plantuml.jar
sudo find $temp_dir -name "*.jar" -exec mv {} /usr/local/bin/plantuml.jar \;

# Remove the temporary directory
rm -rf $temp_dir

# Create a plantuml script in /usr/local/bin that runs the jar file with java
sudo tee /usr/local/bin/plantuml <<EOF
#!/bin/bash
java -jar /usr/local/bin/plantuml.jar "\$@"
EOF

# Make the plantuml script executable
sudo chmod +x /usr/local/bin/plantuml

echo "PlantUML has been updated to the latest version."
