
module init
module sync
module pull

VERSION="0.1.0"

usage() {
  echo "Usage: git popper [COMMAND] [OPTIONS]"
  echo ""
  echo "Available options"
  echo "  -V, --version  Print version info and exit"
  echo "  -h, --help     Print help information"
  echo ""
  echo "Available commands"
  echo "  init    Init the '.gitpopper' file"
  echo "  pull    Pull remote data based on '.gitpopper' file"
  echo "  sync    Synchronize local and remote data"
}

main() {
  local list

  while [ $# -gt 0 ]; do
    case "$1" in
      -*)
        case "$1" in
          --list)
            list=true
            ;;
          -o|--output)
            echo "Handling $1 with value: $2"
            shift
            ;;
          -V|--version)
            echo "git-popper ${VERSION}"
            exit 0
            ;;
          -h|--help)
            usage
            exit 1
            ;;
          *)
            echo "Unknown option: $1" >&2
            exit 1
            ;;
      esac
        ;;
      *)
        break
        ;;
    esac
    shift
  done || true

  gitpopper_file="$PWD/.gitpopper"

  case "$1" in
    init)
      gitpopper_init "${gitpopper_file}"
      ;;
    help)
      usage
      exit 1
      ;;
  esac

  if [ ! -f "${gitpopper_file}" ]; then
    echo "No .gitpopper file found in the current directory"
    exit 1
  fi

  if [ "$#" -eq 0 ]; then
    echo "No arguments supplied"
    exit 1
  fi

  case "$1" in
    pull)
      gitpopper_pull "${gitpopper_file}"
      ;;
    sync)
      gitpopper_init "${gitpopper_file}"
      gitpopper_sync "${gitpopper_file}"
      ;;
  esac
}
