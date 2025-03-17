#!/bin/bash

pushd /vagrant
[[ -e ".env" ]] && source .env || {
  echo "ERROR: .env not filled out. Ask lakinwecker on slack" 1>&2
  exit 1
}

# Create database and user
# TODO: pull this password out of the settings file.
sudo -u postgres psql -c "CREATE USER heltour_lichess4545 WITH PASSWORD 'sown shuts combiner chattels' CREATEDB;"
sudo -u postgres createdb -O heltour_lichess4545 heltour_lichess4545

curl -s --progress-bar http://www.rrweb.org/javafo/current/javafo.jar --output /home/vagrant/heltour/javafo.jar

# Ensure we can connect easily without a password
touch /home/vagrant/.pgpass
chmod 0600 /home/vagrant/.pgpass
echo "localhost:*:heltour_lichess4545:heltour_lichess4545:sown shuts combiner chattels" >/home/vagrant/.pgpass

cd /home/vagrant/
pip install --upgrade pip poetry setuptools
# Setup virtualenv for heltour
virtualenv heltour-env --prompt="(heltour):" --python=/usr/bin/python3.9
source /home/vagrant/heltour-env/bin/activate
pip install --upgrade pip poetry setuptools
cd /home/vagrant/heltour
poetry install
fab update
fab -R vagrant latestdb
