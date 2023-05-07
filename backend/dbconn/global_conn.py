from django.db import connections

def get_data_from_global_db(query):
    try:
        # query = SELECT * FROM schema_name.table_name
        with connections['default'].cursor() as cursor:
            cursor.execute(query)
            result = cursor.fetchall()
        # Process the result as needed
        return result
    except:
        print("*************** Couldn't connect to global database ***************")