import psycopg2

class ConnectionManager:
    port = 5432
    db_name = 'global'
    user = 'postgres'
    password = 'postgres'
    host = 'db_postgres_global'
    
    def insert_hotel(self, nume, nr_stele, adresa, id_localitate):
        query = f"CALL insereaza_in_hotel('{nume}', {nr_stele}, '{adresa}', {id_localitate});"

        try:
            # Establish a connection to the PostgreSQL database
            conn = psycopg2.connect(
                dbname=self.db_name,
                user=self.user,
                password=self.password,
                host=self.host,
                port=self.port
            )

            # Create a cursor object to execute the query
            cursor = conn.cursor()

            # Execute the query
            cursor.execute(query)

            # Commit the transaction
            conn.commit()

            # Close the cursor and connection
            cursor.close()
            conn.close()

            # Return a success status or result if desired
            return True

        except (Exception, psycopg2.Error) as error:
            # Handle any exceptions or errors that occurred during the execution
            # Print or log the error message
            print("Error executing query:", error)

            # Return a failure status or result if desired
            return False 
    
    