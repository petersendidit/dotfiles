" Example scripts.vim code for regret
if did_filetype()
	finish
endif
let i = 1
while i < 10
	if getline(i) =~ '[Rr]egret\(\s\+[Tt]est\)\=\([Tt]ool\|\s\+[Ss]cript\)'
		setf rgt
	elseif getline(i) =~ '^include\s\+global/startup$'
		setf rgt
	endif
	let i += 1
endwhile
