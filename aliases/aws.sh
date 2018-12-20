function shorten_region() {
  local long_region="$1"
  echo "$long_region" \
    | sed -e 's/-//g' \
    | sed -e 's/north/n/' \
    | sed -e 's/east/e/' \
    | sed -e 's/south/s/' \
    | sed -e 's/west/w/' \
    | sed -e 's/central/c/' \
    | sed -e 's/gov/g/'
}
