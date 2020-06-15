SHELL:=/bin/bash
# bash will read this config file first
BASH_ENV=bash_env.sh
export BASH_ENV


all: 
	$(MAKE) clean
	mkdir -p bin                    # no error if already exists
	javac -d bin $$javac_cp $$java_files
	$(MAKE) run_test


junit_runner:=org.junit.runner.JUnitCore
test:=Test_lab7

run_test:
	cp test_bin/$(test).class bin # put the test class in the bin dir
	java $$java_cp $(junit_runner) $(test) # run junit, and execute test 


handin.zip:
	zip -r handin.zip FEEDBACK_MACHINE

clean:
	rm -rf bin/* handin.zip


# ignore ------------------------------------------------------------

test_bin: FORCE
	javac -d test_bin $$javac_cp src/*.java test/*.java
	rm test_bin/CC07.class

# as part of run_test we copy the test class into bin


FORCE:

