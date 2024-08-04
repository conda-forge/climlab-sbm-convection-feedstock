# need to run meson first for cross-compilation case
${PYTHON} $(which meson) setup ${MESON_ARGS} .
${PYTHON} -m pip install . -vv