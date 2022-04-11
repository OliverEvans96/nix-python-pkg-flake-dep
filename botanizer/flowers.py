#!/usr/bin/env python3

import flower_power as fp

def print_some_flowers():
    for flower in fp.list_some_species():
        print(flower)

def print_many_flowers():
    for flower in fp.list_many_species():
        print(flower)
