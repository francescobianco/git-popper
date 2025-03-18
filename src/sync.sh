
gitpopper_sync() {
  local gitpopper_file
  local repository
  local repository_id
  local repository_cache
  local workdir
  local temp_pwd

  gitpopper_file="$1"
  repository_cache=
  workdir=.

  echo "Synchronize gitpopper"

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
          repository_cache="$HOME/.gitpopper/cache/${repository_id}"
          temp_pwd=$(pwd)
          cd "${repository_cache}" || exit 1
          git pull
          cd "${temp_pwd}" || exit 1
          ;;
        WORKDIR)
          workdir=$(echo "${line}" | cut -d" " -f2)
          repository_workdir="${repository_cache}/${workdir}"
          mkdir -p "${repository_workdir}"
          ;;
      esac
  done < "${gitpopper_file}"
}
