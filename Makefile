SHELL := /bin/bash
NDDCOUNT := 7 6 5 4 3 2 1 0
GENPROG := kidney_erdos_renyi_generator
SOLVEPROG := kidney_solver
RESULTS := results

all : all_results.txt

all_results.txt: $(foreach i,$(NDDCOUNT),$(RESULTS)/$i.out )
	cat results/*.out > all_results.txt

define SIZE_template
$(RESULTS)/$(1).out :
	mkdir -p $$(RESULTS) && \
	for p in $$$$(seq 0.01 0.01 0.10); do \
		for i in $$$$(seq 1 200); do \
			( echo "p:" $$$$p && echo "altruist_count:" $(1) && $(GENPROG) 100 $(1) $$$$p | $(SOLVEPROG) 3 2 picef ) | \
		    	awk -f summarise_result.awk | tee -a $$@; \
		done \
	done 
endef

#	$(SRSAT) --random --type 3 --timeout $(TIMEOUT) --n $(1) --lognp $$$$lognp --seed $$$$RANDOM | tee -a $$@ ; \

$(foreach s,$(NDDCOUNT),$(eval $(call SIZE_template,$(s))))

clean:
	rm -f results/*.out
	rm -f all_results.txt


