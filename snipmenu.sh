#!/bin/zsh
:<<COMMENT
Optional description of script.
TODO
* v1.0: dir has files, we store k:v pairs in filename:content
* notify that a CRUD operation has completed
* CRUD
	create
		* DONE open $EDITOR to add new snippet
	read
		* DONE copy file contents to clipboard
	update
		* DONE open $EDITOR to edit selected snippet file
	delete
		* delete selected

COMMENT

SNIPPET_DIR="./snippets"

create_snippet(){
	snippet_file_name=$(echo "" | dmenu -p "Enter new snippet name:")
	$EDITOR "$SNIPPET_DIR"/"$snippet_file_name"
}

read_snippet(){
	cat $SNIPPET_DIR/$(ls $SNIPPET_DIR | dmenu -i) | xclip -selection clipboard
}

update_snippet(){
	$EDITOR $SNIPPET_DIR/$(ls $SNIPPET_DIR | dmenu -i)
}

delete_snippet(){
	rm -f $SNIPPET_DIR/$(ls $SNIPPET_DIR | dmenu -i)
}

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
esac
