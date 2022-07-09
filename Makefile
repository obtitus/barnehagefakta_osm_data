python=. venv/bin/activate; python
git=/usr/bin/git

# /opt/local/bin/python2.7

all:
	$(MAKE) update_data
	$(MAKE) update_osm_batch
	$(MAKE) update_html
	$(MAKE) push_html
	#$(MAKE) update_poi
	$(MAKE) rotate_logs

update_data:
	$(python) ../barnehagefakta_osm.py --kommune ALL --update_kommune -q

update_osm_batch:
	$(python) ../update_osm.py --batch --log_filename="/home/ob/Programming/Python/osm/barnehagefakta_osm/barnehagefakta_osm_data/local.barnahagefakta.update_osm.log"
update_osm:
	$(python) ../update_osm.py -v

update_html:
	$(python) ../generate_html.py
push_html:
	-$(git) add -A
	-$(git) commit -am "data update"
	-$(git) push

update_poi:
	(. venv/bin/activate;cd ..;./to_poi_importer.sh)

rotate_logs:
	logrotate logrotate.conf --state=logrotate.state
