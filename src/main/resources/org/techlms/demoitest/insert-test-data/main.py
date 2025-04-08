import mysql.connector

def store_gif_as_blob(gif_path, course_id):
    """
    Stores a GIF image as a BLOB in the MySQL database.
    """
    connection = None  # Initialize connection to avoid UnboundLocalError
    try:
        config = {
            'host': 'localhost',        # MySQL server host
            'port': 3307,               # Change this to your MySQL port
            'user': 'root',             # MySQL username
            'password': 'root',         # MySQL password
            'database': 'techlms',      # Database name
            'auth_plugin': 'mysql_native_password'  # Use compatible authentication plugin
        }
        # Connect to MySQL database
        connection = mysql.connector.connect(**config)

        # Open the GIF file in binary mode
        with open(gif_path, "rb") as file:
            binary_data = file.read()

        # SQL query to insert the GIF as a BLOB
        sql_query = "UPDATE `course` SET `course_image` = %s WHERE course_id = %s"

        # Execute the query
        cursor = connection.cursor()
        cursor.execute(sql_query, (binary_data, course_id))

        # Commit the transaction
        connection.commit()

        print(f"GIF from '{gif_path}' has been stored successfully as BLOB for course_id {course_id}.")

    except mysql.connector.Error as error:
        print(f"Failed to insert GIF as BLOB: {error}")
    finally:
        if connection and connection.is_connected():
            cursor.close()
            connection.close()
            print("MySQL connection is closed.")

# Provide the path to your GIF and the course_id
gif_path = "course-images/l2s1/opp-t.jpg"
course_id = 5

# Call the function
store_gif_as_blob(gif_path, course_id)


gif_path = "course-images/l2s1/oop.jpg"
course_id = 4

# Call the function
store_gif_as_blob(gif_path, course_id)


gif_path = "course-images/l2s1/oopa.png"
course_id = 3

# Call the function
store_gif_as_blob(gif_path, course_id)




gif_path = "course-images/l2s1/e-commerce.png"
course_id = 2

# Call the function
store_gif_as_blob(gif_path, course_id)



gif_path = "course-images/l2s1/dsa.gif"
course_id = 1

# Call the function
store_gif_as_blob(gif_path, course_id)



gif_path = "course-images/l1s1/webTechnology.jpg"
course_id = 6

# Call the function
store_gif_as_blob(gif_path, course_id)


gif_path = "course-images/l1s1/multiMedia.jpg"
course_id = 7

# Call the function
store_gif_as_blob(gif_path, course_id)


gif_path = "course-images/l1s1/databaseManagementSystem.jpg"
course_id = 8

# Call the function
store_gif_as_blob(gif_path, course_id)



gif_path = "course-images/l1s1/network.jpg"
course_id = 9

# Call the function
store_gif_as_blob(gif_path, course_id)



gif_path = "course-images/l1s1/sever-side-scripting.jpg"
course_id = 10

# Call the function
store_gif_as_blob(gif_path, course_id)


gif_path = "course-images/l3s1/advanceProgramming.jpg"
course_id = 11

# Call the function
store_gif_as_blob(gif_path, course_id)



gif_path = "course-images/l3s1/advance-database-managementSystem.jpg"
course_id = 12

# Call the function
store_gif_as_blob(gif_path, course_id)

gif_path = "course-images/l3s1/operatingSystem.jpg"
course_id = 13

# Call the function
store_gif_as_blob(gif_path, course_id)
gif_path = "course-images/l4s1/softwareDevelopment.jpg"
course_id = 14

# Call the function
store_gif_as_blob(gif_path, course_id)