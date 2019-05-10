#!/bin/sh

#
# This script creates and run the pf4j-spring demo.
#

# create artifacts using maven
mvn clean package -DskipTests

# create demo-dist folder
rm -fr demo-dist
mkdir -p demo-dist/plugins

# copy artifacts to demo-dist folder
cp -r demo/app/target/pf4j-spring-demo-*/* demo-dist/
cp demo/plugins/*/target/*plugin*.jar demo-dist/plugins/
cp demo/plugins/enabled.txt demo-dist/plugins/
cp demo/plugins/disabled.txt demo-dist/plugins/

cd demo-dist

# run demo
mv pf4j-spring-demo-app-*-SNAPSHOT.jar pf4j-spring-demo.jar
java -jar pf4j-spring-demo.jar

cd -
