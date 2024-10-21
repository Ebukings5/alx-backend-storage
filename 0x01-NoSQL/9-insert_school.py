#!usr/bin/env python3

"""
    Python function that inserts a new document in a collection based on kwargs
"""

from pymongo import MongoClient

def insert_school(mongo_collection, **kwargs):

    return mongo_collection.insert_one(kwargs).insert_id
