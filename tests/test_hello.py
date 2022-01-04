import psycopg2
from psycopg2.extras import DictCursor


def pg_conn():
    setting = {
        'host': 'postgres_for_pytest',
        'port': '5432',
        'dbname': 'in_system',
        'user': 'postgres',
        'password': 'postgres'
    }
    return psycopg2.connect(**setting)


def test_hello():
    with pg_conn() as conn:
        with conn.cursor(cursor_factory=DictCursor) as cur:
            sql = "INSERT INTO users(name) values('jessy')"
            cur.execute(sql)
            conn.commit()
            sql = "SELECT * FROM users"
            cur.execute(sql)
            users = cur.fetchall()
            print(users)
    assert True
