import sqlite3


def get_db(file_path: str):
	db = sqlite3.connect("file_path.db")
	return db
