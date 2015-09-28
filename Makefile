all:
	$(MAKE) update_data
	$(MAKE) update_osm
	$(MAKE) update_html

update_data:
	python ../barnehagefakta_osm.py --kommune ALL --update_kommune

update_osm:
	python ../update_osm.py

update_html:
	python ../generate_html.py
