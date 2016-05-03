python=/opt/local/bin/python2.7
git=/usr/bin/git

all:
	$(MAKE) update_data
	$(MAKE) update_osm_batch
	$(MAKE) update_html
	$(MAKE) push_html
	$(MAKE) update_poi
	$(MAKE) rotate_logs

update_data:
	$(python) ../barnehagefakta_osm.py --kommune ALL --update_kommune -q

update_osm_batch:
	$(python) ../update_osm.py --batch --log_filename="/Users/ob/Library/Logs/local.barnahagefakta.update_osm.log"
update_osm:
	$(python) ../update_osm.py -v

update_html:
	$(python) ../generate_html.py
push_html:
	-$(git) add -A
	-$(git) commit -am "data update"
	-$(git) push

update_poi:
	(cd ..;./to_poi_importer.sh)

rotate_logs:
	/opt/local/sbin/logrotate logrotate.conf --state=logrotate.state
