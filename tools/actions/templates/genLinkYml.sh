#!/usr/bin/env sh

new_uuid=$(uuidgen)
new_title="New title guys!"
new_date=$(date -I)

eval_string=".title = \"$new_title\""

eval_string="$eval_string | .id = \"$new_uuid\""
eval_string="$eval_string | .date = \"$new_date\""

eval_string="$eval_string | .url[] = \"\""
eval_string="$eval_string | .url += \"https://sdfsdf.sds\""
eval_string="$eval_string | .url += \"https://ergfdsdfv.sds\""

eval_string="$eval_string | .tags[] = \"\""
eval_string="$eval_string | .tags += \"TAGS\""

eval_string="$eval_string | .links[] = \"\""
eval_string="$eval_string | .content[] = \"\""

yq -n eval "$eval_string"
