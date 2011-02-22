#!/bin/sh

rm -rf jruby-core-1.5.6.jar
rm -rf jruby-stdlib-1.5.6.jar
rm -rf tmp_unpack
mkdir tmp_unpack
cd tmp_unpack
jar xf ../jruby-complete-1.5.6.jar
cd ..
mkdir jruby-core
mv tmp_unpack/org jruby-core/
mv tmp_unpack/com jruby-core/
mv tmp_unpack/jline jruby-core/
mv tmp_unpack/jay jruby-core/
mv tmp_unpack/jruby jruby-core/
cd jruby-core
jar cf ../jruby-core-1.5.6.jar .
cd ../tmp_unpack
jar cf ../jruby-stdlib-1.5.6.jar .
cd ..
rm -rf jruby-core
rm -rf tmp_unpack
rm -rf jruby-complete.jar