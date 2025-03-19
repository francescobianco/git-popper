
gitpopper_init() {
  local gitpopper_file
  local repository
  local repository_id
  local repository_cache
  local workdir

  gitpopper_file="$1"
  repository_cache="$HOME/.git-popper/cache"

  mkdir -p "${repository_cache}"

  if [ ! -f "${gitpopper_file}" ]; then
    read -r -p "Enter repository url: " repository
    repository_id=$(echo "${repository}" | tr -s '/:.' '-')
    if [ ! -d "${repository_cache}/${repository_id}" ]; then
      git clone "${repository}" "${repository_cache}/${repository_id}"
    fi
    read -r -p "Enter working directory: " workdir && true
    workdir_cache="${repository_cache}/${repository_id}/${workdir}"
    mkdir -p "${workdir_cache}"
    if [ ! -f "${workdir_cache}/.gitpopper" ]; then
      echo "FROM ${repository}" > "${workdir_cache}/.gitpopper"
      if [ -n "${workdir}" ]; then
        echo "WORKDIR ${workdir}" >> "${workdir_cache}/.gitpopper"
      fi
    fi
    cp -f "${workdir_cache}/.gitpopper" "${gitpopper_file}"
  fi

  echo "Initializing gitpopper"

  while IFS= read -r line || [[ -n "${line}" ]]; do
    ((row=row+1))
    [[ -z "${line}" ]] && continue
    [[ "${line::1}" == "#" ]] && continue
    instruction=$(echo "${line}" | cut -d" " -f1)
    case "${instruction}" in
        FROM)
          repository=$(echo "${line}" | cut -d" " -f2)
          repository_id=$(echo "${repository}" | tr -s '/:.' '-')
          if [ ! -d "${repository_cache}/${repository_id}" ]; then
            git clone "${repository}" "${repository_cache}/${repository_id}"
          fi
          ;;
      esac
  done < "${gitpopper_file}"
}
