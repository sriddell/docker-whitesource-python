#!/bin/bash

curl -LJO https://github.com/whitesource/unified-agent-distribution/releases/latest/download/wss-unified-agent.jar

curl -LJO https://github.com/whitesource/unified-agent-distribution/raw/master/standAlone/wss-unified-agent.config

java -Xmx4096m -Xms2048m -jar wss-unified-agent.jar "$@"
