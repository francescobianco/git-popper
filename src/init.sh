
gitpopper_init() {
  local gitpopper_file
  local repository
  local repository_id
  local repository_cache

  gitpopper_file="$1"
  repository_cache="$HOME/.gitpopper/cache"

  mkdir -p "${repository_cache}"

  echo "Initializing gitpopper"

  while IFS= read -r line || [[ -n "${line}" ]]; do
    ((row=row+1))
    [[ -z "${line}" ]] && continue
    [[ "${line::1}" == "#" ]] && continue
    #echo ${line}
    instruction=$(echo "${line}" | cut -d" " -f1)
    case "${instruction}" in
        FROM)
          repository=$(echo "${line}" | cut -d" " -f2)
          repository_id=$(echo "${repository}" | tr -s '/:.' '-')
          if [ ! -d "${repository_cache}/${repository_id}" ]; then
            git clone "${repository}" "${repository_cache}/${repository_id}"
          fi
          echo "FROM: $repository"
          ;;
      esac
  done < "${gitpopper_file}"
}
