markdown-benchmark
===

Benchmark node.js markdown to html converter.

This is a script to compare 3 markdown to html converters.
Thanks to [Jasper Van der Jeugt](http://jaspervdj.be/) for the markdown random generator [lorem-markdownum](https://github.com/jaspervdj/lorem-markdownum)

- [Marked]( https://github.com/chjj/marked )
- [markdown-js]( https://github.com/evilstreak/markdown-js )
- [Showdown]( https://github.com/showdownjs/showdown )

**Step 1.:**
Benchmark the 3 converters against each other

**Step 2.:**
Test the markdown parsers during a fake template run against precompiled html

## Results

### Step 1. Fastest converter
The fastest converter is **[Marked]( https://github.com/chjj/marked )** and is up to `3x` faster than the second.  
It can process about `5400 ops/sec`.

### Step 2. Converters vs. Precompiled
Precompiled templating is up to `88x` faster than parsing on the fly.  
It can process about `400000 ops/sec`.

## Raw Results

### Step 1.) Single convert

Convert a single markdown to html

*Results:*

```sh
>> Showdown x 2,324 ops/sec ±0.31% (99 runs sampled)
>> markdown-js x 1,610 ops/sec ±1.10% (98 runs sampled)
>> Marked x 5,680 ops/sec ±0.20% (99 runs sampled)
Fastest test is Marked at 2.4x faster than Showdown
```

### Step 1.) Mutiple converts

Run 2165 converts in a loop

*Results:*

```sh
>> Showdown x 0.93 ops/sec ±1.88% (7 runs sampled)
>> markdown-js x 0.57 ops/sec ±0.68% (6 runs sampled)
>> Marked x 2.78 ops/sec ±0.47% (11 runs sampled)
Fastest test is Marked at 3.0x faster than Showdown
```

### Step 2.) Mutiple converts to html

Run 2165 converts in a loop and create a single ul/li list out of it.

*Results:*

```sh
>> Showdown x 0.83 ops/sec ±1.45% (7 runs sampled)
>> Markdown.js x 0.55 ops/sec ±1.79% (6 runs sampled)
>> Marked x 2.12 ops/sec ±3.88% (10 runs sampled)
>> Pre-converted to HTML x 64.11 ops/sec ±0.65% (53 runs sampled)
Fastest test is Pre-converted to HTML at 30.3x faster than Marked
```

### Step 2.) Single converts to html

Run one converts in a loop and create a single ul/li list out of it.

*Results:*

```sh
>> Showdown x 2,182 ops/sec ±1.30% (101 runs sampled)
>> Markdown.js x 1,586 ops/sec ±0.94% (99 runs sampled)
>> Marked x 5,196 ops/sec ±0.50% (97 runs sampled)
>> Pre-converted to HTML x 454,436 ops/sec ±0.41% (99 runs sampled)
Fastest test is Pre-converted to HTML at 87.5x faster than Marked
```

## Do the benchmark yourself

### run benchmark

make sure you installed, builded and prepared the project.

```sh
grunt bench
```

### install

```sh
# install grunt cli
npm -g install grunt cli
# install modules
npm install .
# build scripts
grunt build
```

### prepare

**fetch random markdowns**

Fetch random markdown from the [lorem-markdownum](https://github.com/jaspervdj/lorem-markdownum) http api and save it to `data.txt`

```sh
# fetch random markdown from http://jaspervdj.be/
node prepare/generate_data.js
```

options:

```sh
# optional environments
CNT=50 TMO=1000 node prepare/generate_data.js
```

**TMO** = *default=`500`* fetch interval timeout in `ms` to prevent overloading the lorem-markdownum http api  
**CNT** = *default=`500`* max count of examples

**pre-convert to bench against precompiled markdown.**

Convert every example from `data.txt` to a array element with the raw markdown in `md` and the html compiled version to `html`.
The results will be saved to `data.json`
This is required to do the step 2 benchmarks.

```sh
# optional environments
node prepare/generated_to_json.js
```

## Release History
|Version|Date|Description|
|:--:|:--:|:--|
|0.0.1|2015-01-29|Initial version|

## Other projects

|Name|Description|
|:--|:--|
|[**compare-md-to-html**](https://github.com/mpneuried/html_2_markdown_compare)|Compare node.js html to markdown converter. This is the oposite of this benchmark, but with a focus on the result quality.|
|[**rsmq**](https://github.com/smrchy/rsmq)|A really simple message queue based on Redis|
|[**rsmq-worker**](https://github.com/mpneuried/rsmq-worker)|Helper to simply implement a worker [RSMQ ( Redis Simple Message Queue )](https://github.com/smrchy/rsmq).|
|[**redis-notifications**](https://github.com/mpneuried/redis-notifications)|A redis based notification engine. It implements the rsmq-worker to savely create notifications and recurring reports|
|[**node-cache**](https://github.com/tcs-de/nodecache)|Simple and fast NodeJS internal caching. Node internal in memory cache like memcached.|
|[**obj-schema**](https://github.com/mpneuried/obj-schema)|Simple module to validate an object by a predefined schema|
|[**redis-sessions**](https://github.com/smrchy/redis-sessions)|An advanced session store for NodeJS and Redis|
|[**connect-redis-sessions**](https://github.com/mpneuried/connect-redis-sessions)|A connect or express middleware to simply use the [redis sessions](https://github.com/smrchy/redis-sessions). With [redis sessions](https://github.com/smrchy/redis-sessions) you can handle multiple sessions per user_id.|
|[**systemhealth**](https://github.com/mpneuried/systemhealth)|Node module to run simple custom checks for your machine or it's connections. It will use [redis-heartbeat](https://github.com/mpneuried/redis-heartbeat) to send the current state to redis.|
|[**task-queue-worker**](https://github.com/smrchy/task-queue-worker)|A powerful tool for background processing of tasks that are run by making standard http requests.|
|[**soyer**](https://github.com/mpneuried/soyer)|Soyer is small lib for serverside use of Google Closure Templates with node.js.|
|[**grunt-soy-compile**](https://github.com/mpneuried/grunt-soy-compile)|Compile Goggle Closure Templates ( SOY ) templates inclding the handling of XLIFF language files.|
|[**backlunr**](https://github.com/mpneuried/backlunr)|A solution to bring Backbone Collections together with the browser fulltext search engine Lunr.js|

## The MIT License (MIT)

Copyright © 2015 M. Peter, http://www.tcs.de

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
