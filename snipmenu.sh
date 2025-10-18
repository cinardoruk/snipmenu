#!/bin/bash
:<<COMMENT
Optional description of script.
TODO
* v2.0: snippet previews, center dmenu on the screen, notify that a CRUD operation has completed
* v1.0: dir has files, we store k:v pairs in filename:content
* check necessary programs exist(xclip, dmenu, x11, etc)
* make repo, push v1.0 to it
* license it
* make readme
* DONE create a systemwide ~/.config/snipmenu dir if it doesn't exist
* CRUD
	create
		* DONE open $EDITOR to add new snippet
	read
		* DONE copy file contents to clipboard
	update
		* DONE open $EDITOR to edit selected snippet file
	delete
		* DONE delete selected

COMMENT

# Check that dmenu and xclip are installed
command -v dmenu >/dev/null 2>&1 || { echo "Error: dmenu is required but not installed" >&2; exit 1; }
command -v xclip >/dev/null 2>&1 || { echo "Error: xclip is required but not installed" >&2; exit 1; }

# set snippet dir and create it if it doesn't exist.
SNIPPET_DIR="${HOME}/.config/snipmenu/snippets"

[ ! -d "$SNIPPET_DIR" ] && mkdir -p "$SNIPPET_DIR"

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
	read)
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
