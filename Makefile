init:
	git clone https://github.com/matcornic/hugo-theme-learn.git workshop-site/themes/learn

install-hugo:
	brew install hugo

run:
	cd website; hugo serve