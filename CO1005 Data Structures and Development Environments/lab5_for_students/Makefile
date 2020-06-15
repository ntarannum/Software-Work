SHELL:=/bin/bash
# bash will read this config file first
BASH_ENV=bash_env.sh
export BASH_ENV


all: 
	$(MAKE) clean
	mkdir -p bin                    # no error if already exists
	javac -d bin $$javac_cp $$java_files

run:
	java $$java_cp CC05


clean:
	rm -rf bin/* 



FORCE:

