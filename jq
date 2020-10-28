def group_by_key(key_filter): group_by(key_filter) | map({(.[0] | key_filter | tostring): .}) | add;
def group_by_key_value(key_filter; value_filter): group_by_key(key_filter) | map_values(value_filter);
def count_by_key(key_filter): group_by_key_value(key_filter; length);

def oneof(values): . as $v | values | any(. == $v);

def tabularize(headers):
    (map(. as $row | headers | map($row[.])) | sort) as $rows
  | (headers, $rows[])
  | @tsv
;

def tabularize:
    (map(to_entries | map(.key)) | add | unique) as $headers
  | tabularize($headers)
;

def pad_str(length_with_padding): . as $str | [range(length_with_padding - length)] | map(" ") | join("") | $str + .;

def align_on(separator): 
    map(split(separator) | map(tostring))
  | (map(.[0]) | max_by(length) | length) as $max_region_length
  | map(
        (.[0] | pad_str($max_region_length)) as $former
      | .[1] as $latter
      | $former + " " + separator + " " + $latter
    );

def expand_jwt: split(".") | .[:2] |= map(@base64d | fromjson);

