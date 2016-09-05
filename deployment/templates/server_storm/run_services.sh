#!/bin/sh
STOM_BIN_DIR="/server_storm/apache-storm-${server_storm_version}/bin"
\${STOM_BIN_DIR}/run_storm_nimbus.sh
sleep 5
\${STOM_BIN_DIR}/run_storm_supervisor.sh
sleep 5
\${STOM_BIN_DIR}/run_storm_ui.sh
sleep 2
\${STOM_BIN_DIR}/run_storm_logviewer.sh
sleep 2
monit -I
