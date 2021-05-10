
#fonction nommée create_table_db()
def create_table_db(conn):
    """ This function allows us to create our table DIC"""
    try:
        cur = conn.cursor()
        sql_query = ursor()
        sql_query = """ CREATE TABLE IF NOT EXISTS DIC(
                 id_ept INTEGER PRIMARY KEY AUTOINCREMENT UNIQUE,
                 nom varchar(50) NOT NULL,
                 prenom varchar(50) NOT NULL,
                 department varchar(50) CHECK( department IN ('TC','GIT','GEM','GEC') ),
                 niveau varchar(50) CHECK( niveau IN ('TC1','TC2','DIC1','DIC2','DIC3') ),
                 phone varchar(50)
                 )"""
        cur.execute(sql_query)
    except Exception as err:
        print("Error while creating table", err)
    else:
        print("Table created successfully")
    

#fonction pour afficher l'ensemble des élèments de ma base de données
def display_table(conn):
    """Cette fonction permet d'afficher 
    le contenu de la base de données """
    try:
        #création du curseur
        cur = conn.cursor()
        cur.execute("""SELECT * FROM DIC""")
        user = cur.fetchall()
        print(user)
    except Exception as err:
        print("Can not display data")
    else:
        print("Success")
    




