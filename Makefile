export PATH := env/bin:$(PATH)

env/done: env/bin/pip requirements.txt
	env/bin/pip install -r requirements.txt
	touch env/done

env/bin/pip:
	python -m venv env

requirements.txt: env/bin/pip-compile requirements.in
	env/bin/pip-compile requirements.in -o requirements.txt

env/bin/pip-compile: env/bin/pip
	env/bin/pip install pip-tools

upgrade: env/bin/pip-compile requirements.in
	env/bin/pip-compile --upgrade requirements.in -o requirements.txt

new-post: env/done
	env/bin/nikola new_post

new-post-ipynb: env/done
	env/bin/nikola new_post --format=ipynb

run: env/done
	env/bin/nikola auto

serve: env/done
	env/bin/nikola serve

build:
	env/bin/nikola build

push: env/done
	env/bin/nikola github_deploy

clean:
	env/bin/nikola clean

rebuild-env:
	rm -rf env
	make

debug: env/done
	NIKOLA_DEBUG=1 env/bin/nikola build --always-execute \
		render_sources:output/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize/index.ipynb \
		render_pages:output/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize/index.html \
		render_posts:cache/posts/2020/atviru-duomenu-katalogo-metaduomenu-analize.html

.PHONY: upgrade run serve build push clean debug
