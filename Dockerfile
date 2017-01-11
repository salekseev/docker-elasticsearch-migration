FROM elasticsearch:2-alpine

ENV ELASTICSEARCH_MIGRATION_VERSION 2.0.3

RUN /usr/share/elasticsearch/bin/plugin install --batch https://github.com/elastic/elasticsearch-migration/releases/download/v$ELASTICSEARCH_MIGRATION_VERSION/elasticsearch-migration-$ELASTICSEARCH_MIGRATION_VERSION.zip
