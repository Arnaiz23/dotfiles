images_url=$HOME/Pictures/wallpaper-4k
image_name=$(
    ls $images_url | fzf --preview="catimg -w 200 $images_url/{}"
)

full_url="$images_url/$image_name"

if [ -f $full_url ]; then
    feh --bg-scale $full_url
else
    echo "This image doesn't exists"
fi
