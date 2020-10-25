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

run: env/done
	env/bin/nikola auto

build:
	env/bin/nikola build

push: env/done
	env/bin/nikola github_deploy

clean:
	env/bin/nikola clean

.PHONY: upgrade run build push clean
