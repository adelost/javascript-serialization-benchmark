#!/bin/bash

node --expose-gc -r ts-node/register index.ts -- testJson

node --expose-gc -r ts-node/register index.ts -- testBson

node --expose-gc -r ts-node/register index.ts -- testAvroJs
node --expose-gc -r ts-node/register index.ts -- testAvroAvsc
node --expose-gc -r ts-node/register index.ts -- testAvroAvscOptional

node --expose-gc -r ts-node/register index.ts -- testProtoJs
node --expose-gc -r ts-node/register index.ts -- testProtoPbf
node --expose-gc -r ts-node/register index.ts -- testProtoGoogle

node --expose-gc -r ts-node/register index.ts -- testJsBin
node --expose-gc -r ts-node/register index.ts -- testJsBinOptional

node --expose-gc -r ts-node/register index.ts -- testBser

node --expose-gc -r ts-node/register index.ts -- testV8
node --expose-gc -r ts-node/register index.ts -- testMsgpack
node --expose-gc -r ts-node/register index.ts -- testCbor
node --expose-gc -r ts-node/register index.ts -- testProtoBufEs

node --expose-gc -r ts-node/register index.ts -- testJsonUnmapped
node --expose-gc -r ts-node/register index.ts -- testAvroAvscUnmapped
node --expose-gc -r ts-node/register index.ts -- testJsBinUnmapped
node --expose-gc -r ts-node/register index.ts -- testJsBinJsonUnmapped
# testBsonUnmapped excluded: current bson version does not support arrays as root input
