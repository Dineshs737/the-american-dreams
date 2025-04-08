import mysql.connector
from mysql.connector import Error

# Function to insert data
def insert_notice(admin_username, notice_name, notice_title, file_path):
    try:
        # Establish connection to the database
        connection = mysql.connector.connect(
            host='localhost',  # Change this to your MySQL host
            port=3307,         # Use the correct port number
            database='techlms',  # Your database name
            user='root',        # Your MySQL username
            password='root'     # Your MySQL password
        )

        if connection.is_connected():
            print("Successfully connected to the database")

            cursor = connection.cursor()

            # Read file as binary data
            with open(file_path, 'rb') as file:
                notice_data = file.read()

            # Insert query
            insert_query = """
            INSERT INTO notices (admin_username, notice_name, notice_title, notice_data, medical_create_date)
            VALUES (%s, %s, %s, %s, CURRENT_TIMESTAMP);
            """

            # Execute insert query with file content as LONGBLOB
            cursor.execute(insert_query, (admin_username, notice_name, notice_title, notice_data))

            # Commit the transaction
            connection.commit()
            print("Notice with file inserted successfully")

    except Error as e:
        print(f"Error: {e}")
    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("Connection closed")

# Example usage
admin_username = "admin123"
notice_name = "Test Notice"
notice_title = "Test Notice with File"
file_path = "test.pdf"  # Replace this with the actual file path

insert_notice(admin_username, notice_name, notice_title, file_path)
