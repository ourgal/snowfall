.IGNORE: move
.PHONY: move purge unpack
all: purge move
	@bash ./unarchive.sh
	@bash ./convert2avif.sh
	@bash ./rename.sh
	@du -sh

move:
	@mv ~/Downloads/*.{*rar*,*7z*,*zip*} .

purge:
	@fish -c 'aria2p purge'

unpack:
	@bash ./unpack.sh

push:
	@bash ./push.sh

rename:
	@bash ./rename.sh
