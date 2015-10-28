python=/opt/local/bin/python2.7

all:
	$(MAKE) update_data
	$(MAKE) update_osm_batch
	$(MAKE) update_html
	$(MAKE) update_poi

update_data:
	$(python) ../barnehagefakta_osm.py --kommune ALL --update_kommune -q

update_osm_batch:
	$(python) ../update_osm.py --batch
update_osm:
	$(python) ../update_osm.py

update_html:
	$(python) ../generate_html.py

update_poi:
	(cd ..;./to_poi_importer.sh)
