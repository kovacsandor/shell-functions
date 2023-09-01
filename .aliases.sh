# Shell functions

function deitsh() {

  if [ -n "$1" ]; then
    echo ""
    echo "Running:"
    echo "docker exec -it $1 sh"
    echo ""

    docker exec -it $1 sh
  else
    echo ""
    echo "Error: Docker container id was not specified"
    echo ""
    echo "  Example:"
    echo "  deitsh fe3fe3d46421b3774c4245a112e3917ec25d7b7b006de6b898076ee9df456e0b"
    echo ""
    echo "  Runs:"
    echo "  docker exec -it fe3fe3d46421b3774c4245a112e3917ec25d7b7b006de6b898076ee9df456e0b sh"
    echo ""
  fi
}
