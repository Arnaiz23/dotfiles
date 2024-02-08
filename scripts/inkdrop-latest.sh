inkdrop_url="https://api.inkdrop.app/download/linux/zip"
temporal_directory=/tmp/inkdrop.zip
app_directory=$HOME/Applications
user_binary=/usr/local/bin

echo "Download and unzip the application..."

wget $inkdrop_url -O $temporal_directory && sudo unzip $temporal_directory -d "$app_directory/inkdrop-app" && rm $temporal_directory

echo "Create the symbolic lynk"

if [ -e "$user_binary/inkdrop" ]; then
  sudo rm -rf "$user_binary/inkdrop"
fi

sudo ln -s "$app_directory/inkdrop-app/inkdrop" "$user_binary/inkdrop"

echo "Task finished. Now you can execute \`inkdrop\`."
