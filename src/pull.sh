
gitpopper_pull() {
  local gitpopper_file
  local repository
  local repository_id
  local repository_cache
  local workdir
  local temp_pwd

  gitpopper_file="$1"
  repository_cache="$HOME/.git-popper/cache"

  mkdir -p "${repository_cache}"

  while IFS= read -r line || [[ -n "${line}" ]]; do
    ((row=row+1))
    [[ -z "${line}" ]] && continue
    [[ "${line::1}" == "#" ]] && continue
    instruction=$(echo "${line}" | cut -d" " -f1)
    case "${instruction}" in
      FROM)
        repository=$(echo "${line}" | cut -d" " -f2)
        repository_id=$(echo "${repository}" | tr -s '/:.' '-')
        if [ -d "${repository_cache}/${repository_id}" ]; then
          temp_pwd=$(pwd)
          cd "${repository_cache}/${repository_id}" || exit 1
          git pull --no-rebase
          cd "${temp_pwd}" || exit 1
        fi
        ;;
    esac
  done < "${gitpopper_file}"
}
