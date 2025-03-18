
module init
module sync

main() {
  local list

    while [ $# -gt 0 ]; do
      case "$1" in
        -*)
          case "$1" in
            --list)
              list=true
              shift
              ;;
            -o|--output)
              echo "Handling $1 with value: $2"
              shift
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

    if [ ! -f "${gitpopper_file}" ]; then
      echo "No .gitpopper file found in the current directory"
      exit 1
    fi

    if [ "$#" -eq 0 ]; then
      echo "No arguments supplied"
      exit 1
    fi

    case "$1" in
      init)
        gitpopper_init "${gitpopper_file}"
        ;;
      sync)
        gitpopper_init "${gitpopper_file}"
        gitpopper_sync "${gitpopper_file}"
        ;;
    esac
}