shorten_region() {
  local long_region="$1"
  sed -e 's/-//g' \
      -e 's/north/n/' \
      -e 's/east/e/' \
      -e 's/south/s/' \
      -e 's/west/w/' \
      -e 's/central/c/' \
      -e 's/gov/g/' <<< "$long_region"
}
