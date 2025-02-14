build:
	@buku -e buku.md
	@sed -i -E 's/- \[(.+)\]\((.+)\)(.+)/"\1" = "\2"/' buku.md
	@mv buku.md quickmarks.key
