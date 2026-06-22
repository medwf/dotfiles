#!/bin/bash
active_workspace_id=$(hyprctl activeworkspace -j | jq '.id')
clients_to_kill=$(hyprctl clients -j | jq ".[] | select(.workspace.id==${active_workspace_id}) | select(.focusHistoryID!=0) | .pid")
if [ -n "$clients_to_kill" ]; then
    echo "$clients_to_kill" | xargs kill
fi
