alias ace='node ace'

function db() {
  local x;

  for i in $@
  do
    x+=$(echo -e "$i")
  done

  ace db:$x
}
