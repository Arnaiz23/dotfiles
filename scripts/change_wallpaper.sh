image_name="ai4.png"
images_url=$HOME/Imágenes/wallpaper-4k

full_url="$images_url/$image_name"

if [ -f $full_url ]; then
  feh --bg-scale $full_url
else
    echo "This image doesn't exists"
fi
