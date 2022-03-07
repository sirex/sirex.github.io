export PATH := env/bin:$(PATH)

env/done: env/bin/pip requirements.txt
	env/bin/pip install -r requirements.txt
	touch env/done

env/bin/pip:
	python -m venv env
	env/bin/pip install --upgrade pip

requirements.txt: env/bin/pip-compile requirements.in
	env/bin/pip-compile requirements.in -o requirements.txt

env/bin/pip-compile: env/bin/pip
	env/bin/pip install pip-tools

.PHONY: upgrade
upgrade: env/bin/pip-compile requirements.in
	env/bin/pip-compile --upgrade requirements.in -o requirements.txt

.PHONY: new-post
new-post: env/done
	env/bin/nikola new_post

.PHONY: new-post-ipynb
new-post-ipynb: env/done
	env/bin/nikola new_post --format=ipynb

.PHONY: run
run: env/done
	env/bin/nikola auto

.PHONY: serve
serve: env/done
	env/bin/nikola serve

.PHONY: build
build:
	env/bin/nikola build

.PHONY: push
push: env/done
	env/bin/nikola github_deploy

.PHONY: clean
clean:
	env/bin/nikola clean

.PHONY: rebuild-env
rebuild-env:
	rm -rf env
	make

.PHONY: debug
debug: env/done
	NIKOLA_DEBUG=1 env/bin/nikola build --always-execute \
		render_sources:output/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize/index.ipynb \
		render_pages:output/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize/index.html \
		render_posts:cache/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize.html
