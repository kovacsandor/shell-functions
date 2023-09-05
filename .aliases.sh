# Shell functions

function dockerExecIt() {

  if [ -n "$1" ]; then
    echo ""
    echo "Running:"
    echo "docker exec --interactive --tty $1 sh"
    echo ""

    docker exec --interactive --tty $1 sh
  else
    echo ""
    echo "Error: Docker container id was not specified"
    echo ""
    echo "  Example:"
    echo "  dockerExecIt fe3fe3d46421b3774c4245a112e3917ec25d7b7b006de6b898076ee9df456e0b"
    echo ""
    echo "  Runs:"
    echo "  docker exec --interactive --tty fe3fe3d46421b3774c4245a112e3917ec25d7b7b006de6b898076ee9df456e0b sh"
    echo ""
  fi
}

function dockerImagePrune() {

  echo ""
  echo "Running:"
  echo "docker image prune --all --force"
  echo ""

  docker image prune --all --force
}

function editFunctions() {

  echo ""
  echo "Running:"
  echo "code ~/.aliases.sh"
  echo ""

  code ~/.aliases.sh
}

function ipAddress() {
  echo ""
  echo "Running:"
  echo "ipconfig getifaddr en0"
  echo ""

  ipconfig getifaddr en0
}

function help() {
  funtion printCommand() {
    if [[ "$1" == "-v" || "$1" == "--verbose" ]]; then
      echo "                              > $2"
      echo ""
    else
    fi
  }

  if [[ -z "$1" || "$1" == "-v" || "$1" == "--verbose" ]]; then
    echo ""
    echo "Available functions:"
    echo ""

    echo "  dockerExecIt [containerId]  Executes an interactive sh shell on the specified docker container"
    printCommand $1 "docker exec --interactive --tty \$containerId sh"

    echo "  dockerImagePrune            Removes all dangling docker images"
    printCommand $1 "docker image prune --all --force"

    echo "  editFunctions               Opens function definitions in Visual Studio Code"
    printCommand $1 "code ~/.aliases.sh"

    echo "  help [options]              Prints all available function names and descriptions"
    echo "                                -v, --verbose: Prints actual commands"
    echo ""

    echo "  ipAddress                   Gets local ip address"
    printCommand $1 "ipconfig getifaddr en0"
    echo ""
  else
    echo ""
    echo "Error: Unknown flag: $1"
    echo ""
    echo "  Flags implemented:"
    echo "  -v, --verbose               Prints actual commands"
    echo ""
    echo "  Example:"
    echo "  help -v"
    echo ""
  fi
}
