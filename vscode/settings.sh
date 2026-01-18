#!/bin/bash


CONF_DIR="$HOME/.config/Code/User"
DATA_DIR="./data"


PS3="Select an option (1-3): "
options=("Export Settings" "Import Settings" "Quit")

select opt in "${options[@]}"
do
    case $opt in
        "Export Settings")
            echo "--- Exporting to $DATA_DIR ---"

            # 0. Clean the data directory
            rm -rf "$DATA_DIR"/*
            mkdir -p "$DATA_DIR/snippets"
            echo "✔ Data directory cleaned."

            # 1. Export Extensions
            code --list-extensions > "$DATA_DIR/extensions.list"
            echo "✔ Extension list saved."

            # 2. Export JSON Configs (Settings, Keys, Tasks)
            cp "$CONF_DIR"/*.json "$DATA_DIR/" 2>/dev/null
            echo "✔ JSON configurations saved."

            # 3. Export Snippets
            cp -r "$CONF_DIR/snippets/." "$DATA_DIR/snippets/" 2>/dev/null
            echo "✔ Snippets saved."

            echo "Done! All files are in $DATA_DIR"
            break
            ;;

        "Import Settings")
            echo "--- Importing from $DATA_DIR ---"

            if [ ! -d "$DATA_DIR" ]; then
                echo "Error: Backup directory not found!"
                exit 1
            fi

            # 1. Improved Extension Install
            if [ -f "$DATA_DIR/extensions.list" ]; then
                echo "Installing extensions in bulk..."
                # Read file into an array and join with spaces
                EXT_LIST=$(tr '\n' ' ' < "$DATA_DIR/extensions.list")

                # Install all extensions in a single command to prevent Node.js crashes
                # We use --force to suppress the "already installed" messages
                code --force --install-extension $EXT_LIST
                echo "✔ Extension sync complete."
            fi

            # 2. Restore JSON Configs
            cp "$DATA_DIR"/*.json "$CONF_DIR/"
            echo "✔ JSON configurations restored."

            # 3. Restore Snippets
            mkdir -p "$CONF_DIR/snippets"
            cp -r "$DATA_DIR/snippets/." "$CONF_DIR/snippets/" 2>/dev/null
            echo "✔ Snippets restored."

            echo "Done! Restart VS Code to apply changes."
            break
            ;;

        "Quit")
            echo "Exiting."
            break
            ;;

        *) echo "Invalid option $REPLY";;
    esac
done