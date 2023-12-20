def group_by_key(key_filter): group_by(key_filter) | map({(.[0] | key_filter | tostring): .}) | (add // {});
def group_by_key_value(key_filter; value_filter): group_by_key(key_filter) | map_values(value_filter);
def count_by_key(key_filter): group_by_key_value(key_filter; length);

def oneof(values): . as $v | values | any(. == $v);

def zip(a;b): if (a | length) == (b | length) then ([range(a | length)] | map([a[.], b[.]])) else empty end;

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

# input should be a single string containing a markdown document
def extract_markdown_codeblocks:
  reduce split("\n")[] as $line ({codeblocks: [], current: {}};
    ((
      $line |
      capture("^(?<indent>[^`]*)(?<ticks>`{3,})(?<language>.*)") |
      .indent |= length |
      .closingString = (.indent * " " + .ticks) |
      .language |= sub(" *$"; "")
    ) // {}) as $parsedLine |

    if .current == {} and ($parsedLine.ticks | length) > 0
    then
      .current = ({lines: []} + $parsedLine)

    elif .current != {} and $line != (.current.closingString)
    then
      .current.lines += [$line]

    elif .current != {} and $line == (.current.closingString)
    then
      .codeblocks += [{
        code: (.current.indent as $indent | .current.lines | map(.[$indent:]) | join("\n")),
        language: .current.language
      }] |
      .current = {}

    else .
    end
  ) |
  .codeblocks;
