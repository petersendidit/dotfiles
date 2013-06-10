# Add `~/bin` to the `$PATH`
PATH="$HOME/bin:$PATH"
# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{bash_prompt,dir_colors,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file
