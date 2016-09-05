#!/bin/sh
COMMAND=logviewer
STOM_BIN_DIR="/server_storm/apache-storm-${server_storm_version}/bin"
\${STOM_BIN_DIR}/storm \${COMMAND}  2>&1 1> \${STOM_BIN_DIR}/\${COMMAND}.log &
echo \$! > \${STOM_BIN_DIR}/storm_\${COMMAND}.pid
