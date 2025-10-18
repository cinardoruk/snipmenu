#!/bin/bash
:<<COMMENT
snipmenu - a simple tool to store and retrieve strings using dmenu. best bound to kb shortcuts.
COMMENT

# Check that dmenu and xclip are installed
command -v dmenu >/dev/null 2>&1 || { echo "Error: dmenu is required but not installed" >&2; exit 1; }
command -v xclip >/dev/null 2>&1 || { echo "Error: xclip is required but not installed" >&2; exit 1; }

# set snippet dir and create it if it doesn't exist.
SNIPPET_DIR="${HOME}/.config/snipmenu/snippets"

if [[ ! -d "$SNIPPET_DIR" ]]; then
	mkdir -p "$SNIPPET_DIR"
	echo "Creating new default snippets directory at $SNIPPET_DIR"
fi

# helper
select_snippet(){
	ls "$SNIPPET_DIR" | dmenu -i -p "$1"
}

# CRUD
create_snippet(){
	local snippet=$(echo "" | dmenu -p "new snippet name:")
	[ -z "$snippet" ] && return
	"$EDITOR" "$SNIPPET_DIR"/"$snippet"
}

read_snippet(){
	local snippet=$(select_snippet 'copy to clipboard')
	[ -z "$snippet" ] && return
	xclip -selection clipboard "$SNIPPET_DIR"/"$snippet"
}

update_snippet(){
	local snippet=$(select_snippet 'update')
	[ -z "$snippet" ] && return
	"$EDITOR" "$SNIPPET_DIR"/"$snippet"
}

delete_snippet(){
	local snippet=$(select_snippet 'delete')
	[ -z "$snippet" ] && return
	rm -f "$SNIPPET_DIR"/"$snippet"
}

# main()
case $1 in
	create)
		create_snippet
		;;
	#read
	"")
		read_snippet
		;;
	update)
		update_snippet
		;;
	delete)
		delete_snippet
		;;
	*)
		echo "Usage: $0 {create|read|update|delete}"
		exit 1
		;;
esac
