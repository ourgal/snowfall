#
# easily download all images from an imgbox gallery
#

help() {
  local script_name=$0

  printf '\nUsage: %s imgbox_gallery_url\n' "${script_name}"
  printf '\nEasily download all images from an imgbox gallery\n\n'
}

check_requirements() {

  declare -a requirements=("curl")

  for requirement in "${requirements[@]}"; do

    if ! command -v "${requirement}" &>/dev/null; then
      printf "\\nError: '%s' is a requirement and wasn't found in this system.\\n\\n" "${requirement}"
      exit 1
    fi

  done
}

extract_name() {
  local url="$1"

  temp=${url##*/}
  echo "${temp%%_*}"
}

folder_name() {
  local url="$1"
  local html="$2"

  temp=${url##*/}
  name=$(echo "$html" | grep -E "<h1>(.*)</h1>" | sed -E 's/<h1>(.*)\s-.*/\1/')
  echo "${name}_${temp%%_*}"
}

number_of_images_in_the_gallery() {
  local url="$1"

  curl -s "${url}" | grep -o -E "[0-9]+ image" | cut -f1 -d" "
}

is_imgbox_gallery_url() {
  local url="$1"

  if [[ ${url} =~ https?://imgbox.com/g/ ]]; then
    true
  else
    false
  fi
}

check_requirements

if [[ $# -ne 1 ]]; then
  help
  exit 1
fi

if [[ $1 == "--help" || $1 == "-h" ]]; then
  help
  exit 0
fi

gallery_url="$1"
html=$(curl -s "$gallery_url")

if ! is_imgbox_gallery_url "${gallery_url}"; then
  printf "\\nError: The inputed url doesn't appear to be a proper imgbox gallery url\\n\\n"
  exit 1
fi

gallery_name=$(folder_name "${gallery_url}" "$html")
mkdir -p "${gallery_name}" && cd "${gallery_name}" || exit

printf '\nAbout to save %d images to folder %s/\n\n' "$(number_of_images_in_the_gallery "${gallery_url}")" "${gallery_name}"

readarray -t urls < <(echo "$html" | grep -E -o 'thumbs[0-9]+.*"' | tr -d '"')

for i in "${!urls[@]}"; do
  printf -v link "https://imgbox.com/%s" "$(extract_name "${urls[$i]}")"
  temp=$(curl -s "${link}" | grep -E -o 'https?.*download=true')
  aria2c --quiet "${temp%%\?*}" --out "${i}.${urls[$i]##*.}"
  echo $((i + 1))
done | tqdm --total ${#urls[@]} >>/dev/null

printf '\n%s images were saved to folder %s/\n' "$(find . -type f | wc -l)" "${gallery_name}"
